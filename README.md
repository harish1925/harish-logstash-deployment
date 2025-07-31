🔧 Logstash Deployment Automation with Terraform & Ansible
📌 Project Overview
This project automates the deployment of Logstash on AWS using Terraform and Ansible. It streamlines infrastructure provisioning and configuration management to create an efficient, repeatable setup for Logstash.

✅ What It Does
Provisions AWS infrastructure, including EC2 instances, VPCs, and subnets, using Terraform.

Installs and configures Logstash using Ansible for streamlined log collection and forwarding.

Provides an automated, repeatable, and efficient deployment process.

💡 Tools Used
Terraform – Infrastructure as Code (IaC) tool to create AWS resources.

Ansible – Configuration management and automation tool to set up Logstash.

AWS – Cloud provider hosting the infrastructure.

Logstash – Tool for collecting, processing, and forwarding logs.

📁 Folder Structure
text
harish-logstash-deployment/
├── terraform/
│   ├── main.tf             # Root config, ONLY calls modules
│   ├── variables.tf
│   ├── outputs.tf
│   └── modules/
│       ├── networking/
│       │   ├── main.tf     # VPC/Subnets/IGW/NAT/etc.
│       │   ├── variables.tf
│       │   ├── outputs.tf
│       └── compute/
│           ├── main.tf     # aws_instance, aws_security_group
│           ├── variables.tf
│           ├── outputs.tf
└── ansible/
├── playbook.yml
├── ansible.cfg
├── inventory
└── roles/
└── logstash/


terraform/    → Terraform configuration files and reusable modules
ansible/     → Ansible playbooks to install and configure Logstash
🧩 Why This Project Is Useful
Saves time by automating manual setup steps.

Easily replicable across different environments (development, staging, production).

Helps teams centralize log collection and monitoring efficiently.

🔒 Git Ignore
Sensitive or large files are excluded from the repository using .gitignore, including:

Terraform state files and folders (.terraform/, terraform.tfstate, *.tfvars)

Private keys and certificates (*.pem, *.key)

Log files (*.log)
