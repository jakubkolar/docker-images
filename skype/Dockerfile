FROM debian:jessie

MAINTAINER Jakub Kolar <koljin@centrum.cz>

# Basic setup
COPY apt.conf /etc/apt/apt.conf
RUN dpkg --add-architecture i386 && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
	curl \
	ca-certificates \
	alsa-base \
	alsa-utils

# Download Skype
RUN curl http://download.skype.com/linux/skype-debian_4.3.0.37-1_i386.deb > /opt/skype.deb \
	&& curl http://www.tataranovich.com/debian/pool/jessie/main/a/apulse/apulse_0.1.6-1_i386.deb > /opt/apulse.deb \
	&& echo 'a820e641d1ee3fece3fdf206f384eb65e764d7b1ceff3bc5dee818beb319993c /opt/skype.deb' | sha256sum -c \
	&& echo '40fed384574efb127a0a1bda2b2887a5a7c6989d2d1f5d64501996a0a66e969d /opt/apulse.deb' | sha256sum -c \
	&& dpkg --force-depends -i /opt/skype.deb /opt/apulse.deb \ 
	&& apt-get install -fy

RUN TZ=Europe/Prague && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
	&& useradd --create-home skype && usermod -a -G audio,video skype

WORKDIR /home/skype
USER skype

CMD [ "apulse", "skype" ]
