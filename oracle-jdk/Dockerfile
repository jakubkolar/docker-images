FROM debian:jessie

MAINTAINER Jakub Kolar <koljin@centrum.cz>

# Basic setup
COPY apt.conf /etc/apt/apt.conf
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
	curl \
	ca-certificates

# Java env8u91
ENV JAVA_VERSION_MAJOR=8 \
	JAVA_VERSION_MINOR=91 \
	JAVA_VERSION_BUILD=14 \
	JAVA_PACKAGE=jdk \
	JAVA_VERSION=1.8.0_91 \
	JAVA_HOME=/opt/jdk1.8.0_91 \
	PATH=${PATH}:/opt/jdk1.8.0_91/bin

# Download Oracle JDK
RUN curl --junk-session-cookies --insecure --location --silent --show-error \
	--header "Cookie: oraclelicense=accept-securebackup-cookie" \
	http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz \
	| gunzip -c \
	| tar -x -C /opt \
	&& chown root:root -R /opt

CMD [ "java" ]
