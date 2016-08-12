#!/bin/sh

# Find the master host based on "JENKINS_MASTER_PORT" variable set by docker
# (see https://docs.docker.com/userguide/dockerlinks/#environment-variables)
JENKINS_HOST=`echo ${JENKINS_MASTER_PORT} | cut -d'/' -f 3`

# Launch the node using Swarm client
exec java -jar swarm-client.jar \
	-master http://${JENKINS_HOST} \
	-executors ${SLAVE_EXECUTORS}
