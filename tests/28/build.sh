#!/usr/bin/env bash
cp -r 28/apache/* ./
docker buildx build . --output type=docker,name=elestio4test/nextcloud:28 | docker load
