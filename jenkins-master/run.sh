#!/bin/sh

# Installation (if needed)
sh install.sh &

# Start jenkins
exec java -Djenkins.install.runSetupWizard=false -jar jenkins.war
