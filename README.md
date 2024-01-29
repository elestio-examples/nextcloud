# Nextcloud CI/CD pipeline

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/nextcloud"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Deploy Nextcloud with CI/CD on Elestio

<img src="nextcloud.png" style='width: 100%;'/>
<br/>
<br/>

# Once deployed ...

You can open Nextcloud here:

    URL: https://[CI_CD_DOMAIN]
    login: root
    password: [ADMIN_PASSWORD]

# Activate CRON jobs

Simplest way is to use CRON installed on the host instance, to configure it go to: https://[CI_CD_DOMAIN]/settings/admin
and select CRON option in the list

then connect over SSH to the VM and type:

    crontab -e

if asked for an editor to use, select 'nano' in the list
Once in the editor add this row at the end of the file

    */5 * * * * docker exec -u www-data [YOURPIPELINENAME]_app_1 php -f /var/www/html/cron.php

if your pipeline name is NC for example, it will be:

    */5 * * * * docker exec -u www-data NC_app_1 php -f /var/www/html/cron.php

In case of doubt you can find the exact container name with this command:

    cd /opt/app;
    docker-compose ps;

# Talk Configuration

This readme provides step-by-step instructions on configuring Talk for your NextCloud instance.

## Configuration Steps:

### 1. Enable Talk App

- Open your NextCloud dashboard.
- Click on your user icon in the top right corner.
- Select "Apps" from the drop-down list.
- Navigate to the `Social & communication` apps section.
- Locate the "Talk" app, download it, and enable it.

### 2. Update STUN Server and TURN Servers

- Go to the following URL in your web browser:

      https://[CI_CD_DOMAIN]/settings/admin/talk

- Scroll down to the `STUN Server` section and update the current STUN URL to:

      [CI_CD_DOMAIN]: 3478

- In the `TURN Servers` section, add the following details:

      turn:only
      [CI_CD_DOMAIN]:3478
      <PASSWORD>
      UPD AND TCP

Replace `<PASSWORD>` with the value of the `STATIC_AUTH_SECRET` environment variable, which can be found in the Elestio overview under "Update Config > ENV."

Now Talk is configured

### 3. Save Changes

- Ensure that you save the changes made to the Talk configuration.
