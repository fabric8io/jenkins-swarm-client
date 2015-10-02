FROM centos:7

RUN yum install -y docker-1.6.0

# Install JDK 7 (latest edition)
RUN yum install -y java-1.7.0-openjdk

RUN curl -sSL -o /usr/share/java/swarm-client.jar http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/2.0/swarm-client-2.0-jar-with-dependencies.jar

ENV JENKINS_HOME /var/jenkins_home

COPY bin/swarm-client.sh /usr/local/bin/swarm-client.sh

WORKDIR /var/jenkins_home

ENTRYPOINT ["/usr/local/bin/swarm-client.sh"]
