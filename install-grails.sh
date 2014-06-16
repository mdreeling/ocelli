#!/bin/bash
curl -s get.gvmtool.net | bash
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/
source "//.gvm/bin/gvm-init.sh"
gvm install grails 2.3.7
