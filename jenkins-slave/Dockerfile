FROM jakubkolar/oracle-jdk

MAINTAINER Jakub Kolar <koljin@centrum.cz>

# =============================== CONFIG ===============================

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
	git

# Java env
ENV JENKINS_HOME=/opt/jenkins \
	SLAVE_EXECUTORS=1 \
	SWARM_VERSION=2.1

# ============================ INSTALLATION ============================

RUN mkdir -p ${JENKINS_HOME} \
	&& curl --location --silent --show-error \
	http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/${SWARM_VERSION}/swarm-client-${SWARM_VERSION}-jar-with-dependencies.jar \
	> ${JENKINS_HOME}/swarm-client.jar

# =============================== STARTUP ==============================

COPY run.sh ${JENKINS_HOME}/run.sh

WORKDIR ${JENKINS_HOME}

ENTRYPOINT [ "sh", "run.sh" ]
