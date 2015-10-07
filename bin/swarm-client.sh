#!/bin/bash

if [ -z $JENKINS_MASTER_URL ]; then
    JENKINS_MASTER_URL=http://jenkins-agent:80
fi

java -jar /usr/share/java/swarm-client.jar -disableSslVerification -master ${JENKINS_MASTER_URL} $*