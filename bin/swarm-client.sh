#!/bin/bash

if [ -z $JENKINS_MASTER_URL ]; then
    JENKINS_MASTER_URL=http://jenkins-agent:80
fi

if [ -z $JENKINS_SWARM_LABEL ]; then
    JENKINS_SWARM_LABEL=swarm
fi

if [ -z $JENKINS_SWARM_EXECUTORS ]; then
    JENKINS_SWARM_EXECUTORS=1
fi

java -jar /usr/share/java/swarm-client.jar -disableSslVerification -executors ${JENKINS_SWARM_EXECUTORS} -master ${JENKINS_MASTER_URL} -labels ${JENKINS_SWARM_LABEL} -labels ${HOSTNAME} -name ${HOSTNAME} $*
