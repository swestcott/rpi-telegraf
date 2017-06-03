#!/bin/sh

docker build -t swestcott/rpi-telegraf:latest .
docker push swestcott/rpi-telegraf:latest
