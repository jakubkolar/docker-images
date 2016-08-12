#!/bin/sh

# Setup
readonly CLI_CMD="java -jar war/WEB-INF/jenkins-cli.jar"

# Check if not done already
[ ! -f installed ] || exit

# Wait until Jekins is running
until ${CLI_CMD} version 2> /dev/null ; do sleep 1 ; done

# Bootstrap
${CLI_CMD} groovy bootstrap.groovy

# Install plugins
while read PLUGIN ; do 
	${CLI_CMD} install-plugin -deploy ${PLUGIN}
done << EOF
swarm
job-dsl
greenballs
saferestart
git
buildtriggerbadge
build-monitor-plugin
build-pipeline-plugin
parameterized-trigger
EOF

# Install finished
touch installed
