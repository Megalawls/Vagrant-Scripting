#!/usr/bin/env bash
#Install Java, maven and git

sudo apt update

#Installing Git
sudo apt-get install -y git

#Installing Java
yes | sudo add-apt-repository ppa:webupd8team/java
sudo apt update
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt install -y oracle-java8-installer
javac -version
sudo apt install oracle-java8-set-default

#Installing SBT
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get install sbt

#Installing Jenkins
sudo wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y jenkins

sudo service jenkins start

#Installing Jira
cd /vagrant_data
sudo chmod a+x atlassian-jira-software-7.4.0-x64.bin
sudo ./atlassian-jira-software-7.4.0-x64.bin -q -varfile response.varfile

#Installing Nexus
cd /opt
sudo mkdir nexus
cd nexus
sudo cp -r /vagrant_data/nexus/* /opt/nexus
sudo chmod a+x /opt/nexus/bin/nexus
sudo chown -R vagrant:vagrant /opt/nexus
cd /opt/nexus/bin
sudo ./nexus start 
#For some reason with this I get mkdir: cannot create directory ‘../sonatype-work’: Permission denied
#I couldnt figure out how to actually make it use sudo mkdir anywhere in the files
#It still actually starts it seems