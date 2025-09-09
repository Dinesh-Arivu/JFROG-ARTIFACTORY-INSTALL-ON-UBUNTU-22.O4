#!/bin/bash
# Install Java  
sudo apt-get update
sudo apt install fontconfig openjdk-17-jre -y
java --version

# Fetch and add the JFrog public GPG key
wget -qO - https://releases.jfrog.io/artifactory/api/gpg/key/public | sudo apt-key add -

# Determine your distribution
DISTRO=$(lsb_release -cs)

# Add JFrog Artifactory repository
echo "deb https://releases.jfrog.io/artifactory/artifactory-debs ${DISTRO} main" | sudo tee -a /etc/apt/sources.list

# Update package lists
sudo apt-get update

# Install JFrog Artifactory Community Edition (C++)
sudo apt-get install jfrog-artifactory-cpp-ce -y
