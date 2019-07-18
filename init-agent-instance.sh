#!/bin/bash
sudo yum install -y java-1.8.0-openjdk-devel.x86_64
sudo wget http://mirrors.estointernet.in/apache/tomcat/tomcat-7/v7.0.94/bin/apache-tomcat-7.0.94.zip
sudo unzip apache-tomcat-7.0.94.zip -d /opt/
cd /opt/apache-tomcat-7.0.94/bin/
sudo chmod 755 *.sh
sudo chmod -R 777 /opt/apache-tomcat-7.0.94/
./startup.sh
sed -e '41i<role rolename=\"manager-gui\"/>' -i /opt/apache-tomcat-7.0.94/conf/tomcat-users.xml
sed -e '42i<user username=\"admin\" password=\"admin\" roles=\"manager-gui\"/>' -i /opt/apache-tomcat-7.0.94/conf/tomcat-users.xml
./shutdown.sh
./startup.sh
