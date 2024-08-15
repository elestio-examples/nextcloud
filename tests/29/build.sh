#!/usr/bin/env bash
cp -r 29/apache/* ./
docker buildx build . --output type=docker,name=elestio4test/nextcloud:29 | docker load
