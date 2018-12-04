#!/bin/bash

if [ -d /opt/tomcat/webapps/ROOT ]; 
 then sudo rm -rf /opt/tomcat/webapps/ROOT 
fi
if [ -f /opt/tomcat/webapps/ROOT.war ]; 
 then sudo rm -f /opt/tomcat/webapps/ROOT.war 
fi
cd /var/lib/jenkins/workspace/EasyPay
gradle clean buil -x test

