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

This challenge implements a scalable and automated deployment of a User Management Application using Kubernetes on AWS EKS. The repository includes Kubernetes manifest files, Helm charts, Terraform scripts, and a CI/CD pipeline using GitHub Actions to deploy the application seamlessly.
Tools and Technologies

    AWS CLI: To interact with AWS services and create EKS clusters.
    EKS (Elastic Kubernetes Service): For running Kubernetes pods.
    Helm: To package and deploy Kubernetes applications.
    Terraform: To provision and manage infrastructure resources.
    Kubectl: To interact with the Kubernetes API.
    Docker: To build, tag, and push application images.
    GitHub Actions: For CI/CD pipeline automation.

Setup Instructions
Environment Preparation

    Update and install prerequisites:

sudo apt-get update
sudo apt-get install -y apt-transport-https software-properties-common

Install the necessary tools:

    AWS CLI:

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip
unzip awscliv2.zip
sudo ./aws/install -i /usr/local/aws-cli -b /usr/local/bin --update

Helm:

curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm

Kubectl:

curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin
kubectl version --short --client

Docker:

        sudo apt-get update
        sudo apt-get install ca-certificates curl
        sudo install -m 0755 -d /etc/apt/keyrings
        sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
        sudo chmod a+r /etc/apt/keyrings/docker.asc
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt-get update
        sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin -y

EKS Cluster Creation

    Create the EKS Cluster:

    aws eks --region ap-south-1 update-kubeconfig --name crewmeister-mubin-challenge
    mv ~/.kube/config ~/.kube/config.bk
    /usr/local/bin/aws eks update-kubeconfig --region ap-south-1 --name crewmeister-mubin-challenge

Namespace Creation

Create separate namespaces for database and application pods:

kubectl create namespace development
kubectl create namespace database

Application Deployment
MySQL Pod

    The MySQL pod is deployed using the Kubernetes manifest files located in the kubernetes-mysql directory.
        MySQL Manifest Files
    Namespace: database

User Management Application

    The Java-based user-management application is deployed using the Helm chart located in the charts directory.
        Helm Chart
    Namespace: development

CI/CD Pipeline

A CI/CD pipeline is configured using GitHub Actions to automate the application build, push Docker images to Docker Hub, and deploy to the EKS cluster using Terraform and Helm.

    Pipeline file: pipeline.yml
    It uses:
        Ubuntu runner: For building Docker images and performing deployments.
        Self-hosted runner: Configured on an EC2 instance to run Helm and Terraform commands.

Docker Image

The Docker image for the User Management Application is built and pushed to Docker Hub:

    Docker Hub Repository: mubinahmed/user-management

Helm Charts

The Helm charts are stored in the charts directory and include the necessary templates to deploy the user-management application:

    Helm Charts

Self-Hosted Runner

A self-hosted GitHub Actions runner is configured on an EC2 instance for executing Helm and Terraform commands efficiently.
Screenshots
EKS Cluster

EKS Cluster Creation
MySQL Pod

MySQL Pod
CI/CD Pipeline and Self-Hosted Runner

Pipeline Runner
Repository Links

    Docker Hub Repository: mubinahmed/user-management
    MySQL Manifest Files: kubernetes-mysql
    Helm Charts: charts
    GitHub Actions Pipeline: pipeline.yml

