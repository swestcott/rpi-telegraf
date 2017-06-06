# rpi-telegraf

[Telegraf 1.3.1](https://github.com/influxdata/telegraf) docker image for use with the Raspberry Pi.

### Usage

Note - no Telegraf configuration is supplied, this must be mounted into the container.

First generate a configuration file,

```
docker run --rm swestcott/rpi-telegraf telegraf --input-filter cpu:mem: --output-filter prometheus_client config > telegraf.conf
```

Then mount `telegraf.conf` into the container

```
docker run --rm --publish 9126:9126 --volume telegraf.conf:/etc/telegraf/telegraf.conf swestcott/pi3-telegraf:latest
```