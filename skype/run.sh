#!/bin/sh

# HOWTO: Timezone setup
TZ=Europe/Prague && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# HOWTO: Start container
docker run -d --name skype \
	-v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY \
	-e ALSA_CARD=PCH \
	--device /dev/snd \
	--device /dev/video0 \
	debian:jessie
