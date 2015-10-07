FROM centos:7

RUN yum install -y docker-1.6.0

RUN yum install -y git wget java-1.8.0-openjdk-devel.x86_64
RUN cd /usr/local && \
  wget https://github.com/github/hub/releases/download/v2.2.1/hub-linux-amd64-2.2.1.tar.gz && \
  tar xf /usr/local/hub-linux-amd64-2.2.1.tar.gz && \
  rm /usr/local/hub-linux-amd64-2.2.1.tar.gz && \
  ln -s /usr/local/hub-linux-amd64-2.2.1/hub /usr/bin/hub

RUN curl -sSL -o /usr/share/java/swarm-client.jar http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/2.0/swarm-client-2.0-jar-with-dependencies.jar

COPY mvnsettings.xml /root/.m2/settings.xml
COPY ssh-config /root/.ssh/config

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.60-2.b27.el7_1.x86_64
ENV JENKINS_HOME /var/jenkins_home

COPY bin/swarm-client.sh /usr/local/bin/swarm-client.sh

WORKDIR /var/jenkins_home


ENTRYPOINT ["/usr/local/bin/swarm-client.sh"]
