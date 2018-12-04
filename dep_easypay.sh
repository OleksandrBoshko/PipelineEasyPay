#!/bin/bash

mkdir $HOME/project3
cd $HOME/project3
git clone git@github.com:OleksandrBoshko/ProjectEasyPay.git .
sudo rm -r /opt/tomcat/webapps/ROOT
sudo rm -r /opt/tomcat/webapps/ROOT.war
gradle clean buil -x test

sudo service postgresql reload
sudo -u postgres psql postgres -c "DROP DATABASE easypay_db;"
#sudo -u postgres psql postgres -c "CREATE USER postgres WITH ENCRYPTED PASSWORD 'root';"
#sudo -u postgres psql postgres -c "ALTER USER postgres WITH PASSWORD 'root';"

sudo mv $HOME/project3/build/libs/project3-1.0-SNAPSHOT.war /opt/tomcat/webapps/ROOT.war

#sudo service postgresql reload
#sudo -u postgres psql postgres -c "CREATE USER postgres WITH ENCRYPTED PASSWORD 'root';"
#sudo -u postgres psql postgres -c "ALTER USER postgres WITH PASSWORD 'root';"
#sudo -u postgres psql postgres -c "DROP DATABASE easypay_db;"

sudo -u postgres psql postgres -c "CREATE DATABASE easypay_db;"
sudo -u postgres psql postgres -c "GRANT ALL PRIVILEGES ON DATABASE easypay_db TO postgres;"

#sudo psql -U $USER -d easypay_db < $HOME/project3/2.sql

sudo -u postgres psql easypay_db < $HOME/project3/2.sql

sudo systemctl restart tomcat


