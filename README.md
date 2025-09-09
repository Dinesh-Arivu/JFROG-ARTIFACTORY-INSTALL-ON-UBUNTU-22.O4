# 🚀 How to Install JFrog Artifactory on Ubuntu 22.04  

## 🏗 What is JFrog Artifactory?  

JFrog Artifactory is a **universal DevOps solution** for hosting, managing, and distributing binaries and artifacts.  
It serves as the **central hub** for your DevOps processes:  

✔️ Stores and secures software artifacts  
✔️ Distributes dependencies and packages  
✔️ Manages Docker images, application installers, libraries, config files, etc.  

In software development, an **artifact** is any object produced during the build and deployment process.  
Artifactory ensures these artifacts are properly managed, versioned, and delivered.  

---

## ⚙️ Installation  

### 1️⃣ Launch Ubuntu Instance on AWS  
1. Login to **AWS Management Console** → Navigate to **EC2 Dashboard**  
2. Click **Launch Instance** → Select **Ubuntu Server 22.04 AMI**  
3. Choose **t2.medium** as instance type  
4. Configure instance details, storage, tags, and security group  
5. Review settings → Click **Launch**  

---

### 2️⃣ Install Java  

```bash
sudo apt-get update
sudo apt install fontconfig openjdk-17-jre -y
java --version
````

---

### 3️⃣ Add JFrog Repository & Install

Fetch and add the JFrog GPG key:

```bash
wget -qO - https://releases.jfrog.io/artifactory/api/gpg/key/public | sudo apt-key add -
```

Get your distribution codename:

```bash
DISTRO=$(lsb_release -cs)
```

Add JFrog Artifactory repository:

```bash
echo "deb https://releases.jfrog.io/artifactory/artifactory-debs ${DISTRO} main" | sudo tee -a /etc/apt/sources.list
```

Update package lists and install:

```bash
sudo apt-get update
sudo apt-get install jfrog-artifactory-cpp-ce -y
```

---

## 🖥 Access in Web Browser

1. Copy your server’s **Public IP**
2. Open ports **8081** and **8082**
3. Access in browser:

```
http://<public-ip>:8081
```

**Default Credentials**:

* Username: `admin`
* Password: `password`

---

## 📜 Full Installation Script

```bash
#!/bin/bash
sudo apt update

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
```

---

