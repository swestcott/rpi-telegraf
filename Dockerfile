FROM hypriot/rpi-alpine:3.5

ENV TELEGRAF_VERSION 1.3.2

ADD https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz /tmp/

RUN cd /tmp \
	&& tar -zxvf /tmp/telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz \
	&& cp -r /tmp/telegraf/* / \
	&& rm -r /tmp/telegraf*

EXPOSE 9126

CMD telegraf
