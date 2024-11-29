DevOps Coding Challenge

This repository demonstrates a DevOps solution to deploy a User Management Application using AWS EKS, Helm, Terraform, and GitHub Actions. It covers the process of setting up the infrastructure, creating and deploying pods for the MySQL database and Java-based user-management application, and automating the workflow with CI/CD pipelines.
Table of Contents

    Overview
    Tools and Technologies
    Setup Instructions
        Environment Preparation
        EKS Cluster Creation
        Namespace Creation
    Application Deployment
        MySQL Pod
        User Management Application
    CI/CD Pipeline
    Docker Image
    Helm Charts
    Self-Hosted Runner
    Screenshots
    Repository Links

Overview

Tools and Technologies

    AWS CLI: To interact with AWS services and create EKS clusters.
    EKS (Elastic Kubernetes Service): For running Kubernetes pods.
    Helm: To package and deploy Kubernetes applications.
    Terraform: To provision and manage infrastructure resources.
    Kubectl: To interact with the Kubernetes API.
    Docker: To build, tag, and push application images.
    GitHub Actions: For CI/CD pipeline automation.

Setup Instructions
Steps:
sudo apt-get update
sudo apt-get install -y apt-transport-https software-properties-common

Install AWS CLI-
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip
unzip awscliv2.zip
sudo ./aws/install -i /usr/local/aws-cli -b /usr/local/bin --update

Install HELM
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm

install kubectl
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin
kubectl version --short --client

install Docker
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin -y

-------------------------
![Alt text](https://mubin-crewmeister-challenge.s3.ap-south-1.amazonaws.com/eks-cluster-creation.png)

After Creating EKS Cluster

aws eks --region ap-south-1 update-kubeconfig --name crewmeister-mubin-challenge

mv ~/.kube/config ~/.kube/config.bk
/usr/local/bin/aws eks update-kubeconfig --region ap-south-1  --name crewmeister-mubin-challenge

-------------------------
Create namespaces for running pods into their specific apps, here is used mysql and development namespace


kubectl create namespace development
kubectl create namespace database

-------------------------

Created mysql pod of saving user management data

manifest files are in *kubernetes-mysql* directory 
https://github.com/mubinfshaikh/devops-coding-challenge/tree/main/kubernetes-mysql

![mysql-db-pod](https://github.com/user-attachments/assets/131672eb-cd6c-4baf-86f8-b6b365b4e0a8)


create user-management pod for java user app 
Helm chart created in *charts* directory
https://github.com/mubinfshaikh/devops-coding-challenge/tree/main/charts

![Screenshot 2024-11-28 215013](https://github.com/user-attachments/assets/c9186ec8-385c-49b8-a91a-764c5cc0107a)

![image](https://github.com/user-attachments/assets/0c55c2c2-ecc6-412a-bb1d-287a98d8ec09)

![image](https://github.com/user-attachments/assets/fb7bef2f-93d4-4804-853c-7263b93241ac)

-----------------------------------

Link to Docker hub repository : https://hub.docker.com/repository/docker/mubinahmed/user-management/general

-----------------------------------

Gitactions pipeline / jobs created : used ubuntu runner + self-hosted runner i.e my ec2 where my helm and terraform is installed
https://github.com/mubinfshaikh/devops-coding-challenge/blob/main/.github/workflows/pipeline.yml

----------------------------------
self-hosted runner

![image](https://github.com/user-attachments/assets/14115e2e-c248-42f2-807e-c33c14d7000c)

----------------------------------

Git Action Pipline link and image:
https://github.com/mubinfshaikh/devops-coding-challenge/actions/runs/12071561744

![image](https://github.com/user-attachments/assets/9b6fe128-9082-42c0-bc4f-45c55df13341)

