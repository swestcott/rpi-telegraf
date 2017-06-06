FROM hypriot/rpi-alpine-scratch:edge

ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.3.1_linux_armhf.tar.gz /tmp/

RUN cd /tmp \
	&& tar -zxvf /tmp/telegraf-1.3.1_linux_armhf.tar.gz \
	&& cp -r /tmp/telegraf/* / \
	&& rm /tmp/telegraf-1.3.1_linux_armhf.tar.gz \
	&& rm -r /tmp/telegraf

CMD telegraf
