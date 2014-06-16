#!/bin/bash
sudo service nginx start&
sudo service elasticsearch start&
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/
source /.gvm/bin/gvm-init.sh
cd /opt/ocelli/grails-ocelli
grails run-app
