FROM hypriot/rpi-alpine:3.6
LABEL maintainer="swestcott@gmail.com"

ENV TELEGRAF_VERSION 1.5.1

RUN sed -i -e 's/http/https/g' /etc/apk/repositories
RUN apk --no-cache upgrade

ADD https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz /tmp/

RUN cd /tmp \
	&& tar -zxvf /tmp/telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz \
	&& cp -r /tmp/telegraf/* / \
	&& rm -r /tmp/telegraf*

#USER nobody
EXPOSE 9126
CMD telegraf
