#!/bin/bash

set -e

# Update the instance
sudo yum update -y

# Install Git
sudo yum install git -y

# Install Terraform
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

# Install AWS SAM CLI with checksum verification
SAM_VERSION="1.104.0"
SAM_CHECKSUM="a2f4625f2693893699a2b27a3f0d238059a4a754b2d6a45a6435f1c50a7862f1"
wget https://github.com/aws/aws-sam-cli/releases/download/v${SAM_VERSION}/aws-sam-cli-linux-x86_64.zip
echo "${SAM_CHECKSUM}  aws-sam-cli-linux-x86_64.zip" | sha256sum -c -
unzip aws-sam-cli-linux-x86_64.zip -d sam-installation
sudo ./sam-installation/install
rm -rf aws-sam-cli-linux-x86_64.zip sam-installation

# Install Node.js and npm with version pinning
NVM_VERSION="v0.39.1"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh | bash
. ~/.nvm/nvm.sh
nvm install 20
nvm use 20
nvm alias default 20

# Verify installations
echo "Verifying installations..."
git --version
terraform --version
sam --version
node --version
npm --version
aws --version

echo "Bootstrap script finished!"
