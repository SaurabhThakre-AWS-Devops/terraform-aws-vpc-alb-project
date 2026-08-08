# 🚀 Terraform AWS VPC + Application Load Balancer

A hands-on AWS infrastructure project using **Terraform** to provision a highly available web application architecture across two Availability Zones.

The project creates a custom VPC, public subnets, EC2 web servers, security groups, an Application Load Balancer, target group, health checks, and HTTP listener — all managed as Infrastructure as Code.

---

## 🏗️ Architecture

```text
                         Internet
                            │
                            ▼
                ┌──────────────────────┐
                │ Application Load     │
                │      Balancer        │
                └──────────┬───────────┘
                           │
                 ┌─────────┴─────────┐
                 │                   │
                 ▼                   ▼
          ┌─────────────┐     ┌─────────────┐
          │    EC2-1    │     │    EC2-2    │
          │  AZ-1       │     │  AZ-2       │
          └─────────────┘     └─────────────┘
                 │                   │
                 └─────────┬─────────┘
                           │
                    ┌──────▼──────┐
                    │     VPC     │
                    │ 10.0.0.0/16 │
                    └──────┬──────┘
                           │
                  Internet Gateway
```

---

## ☁️ AWS Resources

Terraform provisions the following resources:

* Custom VPC
* 2 Public Subnets
* Internet Gateway
* Public Route Table
* Route Table Associations
* Security Groups
* 2 EC2 Instances
* Application Load Balancer
* Target Group
* Target Group Attachments
* ALB Listener
* EC2 Health Checks

---

## 🛠️ Technologies Used

* **AWS**
* **Terraform**
* **Amazon EC2**
* **Amazon VPC**
* **Application Load Balancer**
* **Security Groups**
* **Linux**
* **Apache HTTP Server**

---

## 📁 Project Structure

```text
terraform-aws-vpc-alb-project/
│
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── data.tf
├── security_groups.tf
├── ec2.tf
├── alb.tf
├── user_data.sh
├── terraform.tfvars
├── .gitignore
└── README.md
```

### File Description

| File                 | Purpose                                    |
| -------------------- | ------------------------------------------ |
| `provider.tf`        | Terraform and AWS provider configuration   |
| `main.tf`            | VPC, subnets, Internet Gateway and routing |
| `variables.tf`       | Input variables                            |
| `data.tf`            | Retrieves the latest Amazon Linux 2023 AMI |
| `security_groups.tf` | ALB and EC2 security groups                |
| `ec2.tf`             | Creates EC2 web servers                    |
| `alb.tf`             | Creates ALB, target group and listener     |
| `user_data.sh`       | Installs and configures Apache             |
| `outputs.tf`         | Displays important infrastructure outputs  |
| `terraform.tfvars`   | Provides project-specific variable values  |

---

# ⚙️ Prerequisites

Before deploying the project, make sure you have:

* AWS account
* AWS CLI
* Terraform
* Configured AWS credentials

Verify Terraform:

```bash
terraform version
```

Verify AWS CLI:

```bash
aws --version
```

Verify AWS credentials:

```bash
aws sts get-caller-identity
```

---

# 🚀 Deployment

### 1. Clone the repository

```bash
git clone https://github.com/SaurabhThakre-AWS-Devops/terraform-aws-vpc-alb-project.git
```

Move into the project directory:

```bash
cd terraform-aws-vpc-alb-project
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Format Terraform files

```bash
terraform fmt
```

### 4. Validate configuration

```bash
terraform validate
```

### 5. Review execution plan

```bash
terraform plan
```

### 6. Create infrastructure

```bash
terraform apply
```

Enter:

```text
yes
```

when Terraform asks for confirmation.

---

# 🌐 Access the Application

After deployment, get the ALB DNS name:

```bash
terraform output alb_dns_name
```

Open the displayed DNS name in a browser:

```text
http://<ALB-DNS-NAME>
```

The Apache web page will display information about the EC2 server handling the request.

---

# 🔄 Traffic Flow

The application traffic follows this path:

```text
User
  │
  ▼
Internet
  │
  ▼
Application Load Balancer
  │
  ▼
Target Group
  │
  ├──► EC2 Instance 1
  │
  └──► EC2 Instance 2
```

The ALB performs health checks on the EC2 instances and forwards traffic to healthy targets.

---

# 🔐 Security

Separate security groups are used for the ALB and EC2 instances.

### ALB Security Group

Allows:

```text
HTTP : 80
Source: 0.0.0.0/0
```

### EC2 Security Group

Allows:

```text
HTTP : 80
Source: ALB Security Group
```

This prevents arbitrary internet traffic from directly accessing the EC2 web servers over HTTP.

> For production environments, SSH access should be restricted to a trusted IP range or replaced with AWS Systems Manager Session Manager.

---

# 🧩 Infrastructure as Code Flow

```text
Terraform Configuration
        │
        ▼
terraform init
        │
        ▼
terraform plan
        │
        ▼
terraform apply
        │
        ▼
AWS Infrastructure
        │
        ├── VPC
        ├── Subnets
        ├── Route Table
        ├── Security Groups
        ├── EC2
        └── ALB
```

---

# 🧹 Destroy Infrastructure

To remove all resources created by Terraform:

```bash
terraform destroy
```

Confirm with:

```text
yes
```

Destroy the resources when they are no longer required to avoid unnecessary AWS charges.

---

# 📌 Key Learning Outcomes

This project demonstrates practical knowledge of:

* AWS VPC networking
* Public subnets
* Internet Gateway
* Route tables
* EC2 provisioning
* Security group design
* Application Load Balancer
* Target groups
* ALB health checks
* Terraform Infrastructure as Code
* Terraform variables and outputs
* EC2 user data
* Multi-AZ architecture

---

# 🎯 Interview Explanation

> I created an AWS VPC using Terraform with two public subnets across two Availability Zones. I deployed two EC2 instances running Apache and placed them behind an Application Load Balancer. The ALB forwards HTTP requests to the target group, while health checks ensure traffic is sent only to healthy EC2 instances. The complete infrastructure is managed using Terraform as Infrastructure as Code.

---

# 🔮 Future Enhancements

Possible improvements for a production-style architecture:

* Private subnets for EC2
* NAT Gateway
* HTTPS using ACM
* Route 53 DNS
* Auto Scaling Group
* CloudWatch monitoring
* Remote Terraform state using S3
* DynamoDB state locking where applicable
* CI/CD pipeline for Terraform
* Terraform modules
* AWS Systems Manager Session Manager

---

## 👨‍💻 Author

**Saurabh Thakre**

AWS DevOps Engineer

**GitHub:**
https://github.com/SaurabhThakre-AWS-Devops

---

## ⭐ Project Summary

This project demonstrates how Terraform can be used to automate AWS infrastructure provisioning and deploy a scalable web application architecture using VPC, EC2, and an Application Load Balancer.

The project focuses on **Infrastructure as Code, AWS networking, load balancing, security, and automation**.
