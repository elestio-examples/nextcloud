#!/usr/bin/env bash
cp -r 27/apache/* ./
docker buildx build . --output type=docker,name=elestio4test/nextcloud:latest | docker load
