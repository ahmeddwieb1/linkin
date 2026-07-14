# 🚀 Linkin Deployment Platform

> Transforming a real-world Node.js application into a production-ready deployment using Infrastructure as Code, Configuration Management, and CI/CD automation.

---

## 📖 Overview

This project focuses on the **deployment and infrastructure** of an existing Node.js application rather than application development itself.

The objective is to simulate a real production environment by automating infrastructure provisioning, server configuration, and application deployment while following DevOps best practices.

Instead of deploying the application manually, the project gradually evolves from a basic deployment into a maintainable, production-oriented platform.

---

# 🎯 Objectives

* Deploy a containerized Node.js application on AWS.
* Automate infrastructure provisioning.
* Eliminate repetitive manual server configuration.
* Build a reproducible deployment workflow.
* Learn production deployment practices through a real project.

---

# 🏗 Architecture

```
Developer
      │
      ▼
GitLab Repository
      │
      ▼
GitLab CI/CD
      │
      ▼
Docker Hub
      │
      ▼
AWS EC2
      │
      ▼
Nginx Reverse Proxy
      │
      ▼
Node.js Application
      │
      ▼
MongoDB Atlas
```

---

# 🛠 Tech Stack

## Infrastructure

* AWS EC2
* VPC
* Public Subnet
* Internet Gateway
* Route Tables
* Security Groups
* Elastic IP

## Infrastructure as Code

* Terraform

## Configuration Management

* Ansible *(Phase 2)*

## Containerization

* Docker

## CI/CD

* GitLab CI/CD

## Reverse Proxy

* Nginx

## Database

* MongoDB Atlas

## Operating System

* Ubuntu Server

---

# 🚀 Project Evolution

## Phase 1 — Working Deployment ✅

The first milestone was getting the application deployed successfully.

### Completed

* Containerized the Node.js application.
* Created a GitLab CI/CD pipeline.
* Built Docker images automatically.
* Published images to Docker Hub.
* Deployed containers on AWS EC2.
* Configured Nginx as a reverse proxy.
* Connected a custom domain.
* Debugged deployment, networking, and DNS issues.

### Lessons Learned

At this stage, the deployment worked, but the server was configured almost entirely through manual steps.

To improve that, the installation and initial setup were moved into **EC2 User Data**, allowing the instance to bootstrap itself automatically.

Although this reduced manual work, it quickly became clear that User Data was not the best long-term solution for server configuration.

That realization led to the next phase.

---

# ⚙️ Phase 2 — Infrastructure & Configuration Management 🚧

Current focus:

* Provision AWS infrastructure using Terraform.
* Replace large User Data scripts with Ansible playbooks.
* Improve the GitLab CI/CD pipeline.
* Separate infrastructure, configuration, and deployment responsibilities.

Current architecture:

* **Terraform** → Infrastructure
* **Ansible** → Server Configuration
* **GitLab CI/CD** → Application Deployment

This separation makes the project easier to maintain, extend, and reproduce.

---

# 📂 Repository Structure

```text
.
├── terraform/
├── ansible/
├── backend/
├── nginx/
├── docker/
├── .gitlab-ci.yml
└── README.md
```

---

# 🔄 Deployment Workflow

```
Developer

↓

Push Code

↓

GitLab CI/CD

↓

Build Docker Image

↓

Push to Docker Hub

↓

Deploy to EC2

↓

Pull Latest Image

↓

Restart Container

↓

Nginx

↓

Production
```

---

# 🌍 Infrastructure

Terraform provisions:

* VPC
* Public Subnet
* Internet Gateway
* Route Table
* Security Groups
* EC2 Instance
* Elastic IP

---

# 🔧 Configuration

Server configuration is handled using Ansible.

Examples include:

* Docker installation
* Nginx installation
* Configuration deployment
* Package management
* Service management
* Future SSL automation

---

# 🔐 Security

Current practices include:

* Environment variables for sensitive configuration
* Docker container isolation
* Nginx reverse proxy
* Security Groups
* Elastic IP

Future improvements:

* HTTPS
* Ansible Vault
* IAM least-privilege permissions
* Secrets management

---

# 📈 Future Roadmap

* HTTPS with Let's Encrypt
* CloudWatch Monitoring
* CloudWatch Alarms
* Prometheus
* Grafana
* Ansible Roles
* Ansible Templates
* Ansible Vault
* Infrastructure improvements
* Automated rollback strategy
* Production logging

---

# 📚 Lessons Learned

Some of the most valuable lessons from this project include:

* Infrastructure provisioning and server configuration are different responsibilities.
* Terraform should create infrastructure, not manage application configuration.
* User Data is useful for bootstrapping but becomes difficult to maintain as configuration grows.
* Configuration Management tools like Ansible provide a cleaner and more scalable solution.
* CI/CD pipelines should deploy applications, not recreate infrastructure.
* Understanding the complete deployment stack is more important than mastering a single tool.

---

# 📖 Documentation

Additional documentation will include:

* Deployment Guide
* Terraform Architecture
* Ansible Playbooks
* GitLab CI/CD Pipeline
* Nginx Configuration
* Troubleshooting Guide
* Design Decisions
* Architecture Diagrams

---

# 🤝 Contributing

Suggestions, discussions, and improvements are always welcome.

Feel free to open an Issue or submit a Pull Request.

---

# 🏷 Tags

**#Docker** **#Terraform** **#Ansible** **#GitLabCI** **#AWS** **#EC2** **#Nginx** **#MongoDBAtlas** **#DevOps** **#InfrastructureAsCode** **#CloudEngineering**
