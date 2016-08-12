FROM jakubkolar/oracle-jdk

MAINTAINER Jakub Kolar <koljin@centrum.cz>

# =============================== CONFIG ===============================

# Jenkins env
ENV JENKINS_VERSION=2.7.1 \
	JENKINS_HOME=/opt/jenkins \
	JENKINS_URL=http://localhost:8080

EXPOSE 8080

# ============================ INSTALLATION ============================

RUN mkdir -p ${JENKINS_HOME} \
	&& curl --location --silent --show-error \
	http://mirrors.jenkins-ci.org/war-stable/${JENKINS_VERSION}/jenkins.war \
	> ${JENKINS_HOME}/jenkins.war

# =============================== STARTUP ==============================

COPY bootstrap.groovy install.sh run.sh ${JENKINS_HOME}/

WORKDIR ${JENKINS_HOME}

ENTRYPOINT [ "sh", "run.sh" ]
