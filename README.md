# rpi-telegraf

[![Build](https://img.shields.io/docker/automated/swestcott/rpi-telegraf.svg)](https://hub.docker.com/r/swestcott/rpi-telegraf)
[![Build Status](https://img.shields.io/docker/build/swestcott/rpi-telegraf.svg)](https://hub.docker.com/r/swestcott/rpi-telegraf)
[![GitHub release](https://img.shields.io/github/release/swestcott/rpi-telegraf/all.svg)](https://github.com/swestcott/rpi-telegraf/releases)
[![Docker Pulls](https://img.shields.io/docker/pulls/swestcott/rpi-telegraf.svg)](https://img.shields.io/docker/pulls/rook/rook.svg)
[![Image Size](https://img.shields.io/microbadger/image-size/swestcott/rpi-telegraf.svg)](https://microbadger.com/images/swestcott/rpi-telegraf)
[![License](https://img.shields.io/github/license/swestcott/rpi-telegraf.svg)](https://github.com/swestcott/rpi-telegraf)

[Telegraf](https://github.com/influxdata/telegraf) docker image for use with the Raspberry Pi.

### Usage

_Note - no Telegraf configuration is supplied, this must be mounted into the container._

First generate a configuration file. This example collects CPU/memory stats and exposes them for Prometheus to collect.

```
docker run --rm swestcott/rpi-telegraf telegraf --input-filter cpu:mem: --output-filter prometheus_client config > telegraf.conf
```

Then mount `telegraf.conf` into the container

```
docker run --rm --publish 9126:9126 --volume telegraf.conf:/etc/telegraf/telegraf.conf swestcott/pi3-telegraf:latest
```

### Verify

```
curl -s http://localhost:9126/metrics
```
