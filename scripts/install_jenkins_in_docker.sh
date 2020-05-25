#!/bin/bash

## Initial script to install a docker instance where we will install a fresh new jenkins
## This is intended to be executed in a fresh unix/linux machine/server

# Update the list of existing packages
sudo apt update

# Pre-requisite packages to be able to use apt over https
sudo apt install apt-transport-https ca-certificates curl software-properties-common

# Adding GPG key for the Docker repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Linking the apt to the docker repo (done in the specific architecture, debian 64 bits)
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

sudo apt update

sudo apt install docker-ce

echo $(sudo systemctl status docker)
echo "Docker succesfully installed"
echo "##################"
echo "##################"
echo "##################"
echo "Installing jenkins..."

# Adding the key of the jenkins repo to the system
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c $(echo deb http://pkg.jenkins.io/debian-stable binary/ >/etc/apt/sources.list.d/jenkins.list)

# Make apt to update with the new repo
sudo apt update
#Install jenkins
sudo apt install jenkins
echo "Jenkins installed"
echo "Starting Jenkins"
echo "##################"
sudo systemctl start jenkins

echo "Jenkins has now been started"
#User management
echo "Adding the current user to the docker group"
sudo usermod -aG docker ${USER}
su - ${USER}

echo "Jenkins has been succesfully "
