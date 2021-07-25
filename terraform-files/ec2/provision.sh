#!/bin/bash

#Prep tools 
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install jq -y
sudo apt-get install zip -y
sudo apt-get install unzip -y


#SETUP & INSTALL AWSCLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Install kops
curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x ./kops
sudo mv ./kops /usr/local/bin/

# Install kubectl
curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

#SETUP & INSTALL TERRAFORM
sudo curl -sLO https://releases.hashicorp.com/terraform/1.0.2/terraform_1.0.2_linux_amd64.zip
sudo unzip terraform_1.0.2_linux_amd64.zip
sudo chmod +x ./terraform
sudo mv ./terraform /usr/local/bin/terraform

#Java for Jenkins
sudo apt install openjdk-8-jdk -y
java -version


#Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins -y
sudo usermod -aG docker jenkins


#Suite Jenkins for Kubectl
sudo bash -c 'echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers'
sudo -u jenkins -H sh -c 'ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""'
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
