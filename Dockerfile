FROM centos:7

RUN yum install -y docker-1.6.0

RUN yum install -y git wget java-1.8.0-openjdk-devel.x86_64

RUN curl -sSL -o /usr/share/java/swarm-client.jar http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/2.0/swarm-client-2.0-jar-with-dependencies.jar

# use hub compiled from source so we can use GIT_TOKEN
COPY hub /usr/bin/hub
COPY mvnsettings.xml /root/.m2/settings.xml
COPY ssh-config /root/.ssh/config

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.60-2.b27.el7_1.x86_64
ENV JENKINS_HOME /var/jenkins_home

COPY bin/swarm-client.sh /usr/local/bin/swarm-client.sh
COPY postStart.sh /var/jenkins_home/postStart.sh
WORKDIR /var/jenkins_home


ENTRYPOINT ["/usr/local/bin/swarm-client.sh"]
