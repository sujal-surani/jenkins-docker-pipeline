#!/bin/bash

apt-get update -y
apt-get install -y fontconfig openjdk-21-jre docker.io

systemctl enable docker
systemctl start docker

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

apt-get update -y
apt-get install -y jenkins

systemctl enable jenkins
systemctl start jenkins

usermod -aG docker jenkins
usermod -aG docker ubuntu
systemctl restart jenkins docker