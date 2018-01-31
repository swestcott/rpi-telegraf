FROM resin/armhf-alpine:3.7
LABEL maintainer="swestcott@gmail.com"

ENV TELEGRAF_VERSION 1.5.1

RUN ["cross-build-start"]

ADD https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz /tmp/

RUN apk --update --no-cache upgrade \
	&& cd /tmp \
	&& tar -zxvf /tmp/telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz \
	&& cp -r /tmp/telegraf/* / \
	&& rm -r /tmp/telegraf* \
	&& rm -r /var/cache/apk/*

RUN ["cross-build-end"]

#USER nobody
EXPOSE 9126
CMD telegraf
