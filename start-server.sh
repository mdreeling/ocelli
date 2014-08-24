#!/bin/bash
sudo service nginx start&
sudo service elasticsearch start&
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/
java -javaagent:/opt/ocelli/config/newrelic/newrelic.jar -jar /opt/ocelli/bin/ocelli-server-0.0.1-SNAPSHOT.jar server /opt/ocelli/ocelli-server.yml&
source /.gvm/bin/gvm-init.sh
cd /opt/ocelli/grails-ocelli
grails run-app
