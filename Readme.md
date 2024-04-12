# Project Name

Brief description of your project.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Modules](#modules)
- [Variables](#variables)
- [Outputs](#outputs)
- [Contributing](#contributing)
- [License](#license)

## Introduction
# AWS Infrastructure Deployment

This repository contains Terraform code to deploy AWS infrastructure for a web application. The infrastructure includes VPC setup, security groups, load balancer, Route 53 configuration, CloudWatch alarms, and Auto Scaling.

## Prerequisites

Before you begin, ensure you have met the following requirements:
- Install Terraform: [Terraform Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- AWS IAM Credentials: Ensure you have AWS IAM credentials configured with appropriate permissions to create resources.

## Installation
1. Clone this repository. `git clone https://github.com/yepjainCreate/Terraform_AWS_Test.git`
2. Navigate to the repository directory: `cd aws-infrastructure`
3. Initialize Terraform: `terraform init`
4. Set up your AWS credentials by providing the `access_key` and `secret_key` in `terraform.tfvars` or through environment variables.
5. Review and customize the variables in `variables.tf` to match your requirements. and make sure you are adding Access Key and Secret Key according to your needs
4. Run `terraform init` to initialize the working directory.
6. Optionally, review and modify the Terraform modules in the module directory.
7. Run `terraform apply` to apply the Terraform configuration to create the infrastructure.
8. Confirm the changes and type yes to proceed.
9. Once the deployment is complete, you will see output including the DNS name of the load balancer.
10. To destroy the infrastructure, run:
terraform destroy

#  Terraform Modules

- `networking_Module` : Sets up the VPC, public and private subnets.
- `sg_Module`: Configures security groups.
- `certificate_Module`: Manages SSL/TLS certificates.
- `loadBalancer_Module`: Creates an Application Load Balancer.
- `Route53_Module`: Configures Route 53 DNS records.
- `cloudwatch_Module`: Sets up CloudWatch alarms for monitoring.
- `autoscaling_Module`: Configures Auto Scaling policies.

# Variables
- `access_key`: AWS access key.
- `secret_key`: AWS secret key.
- `region`: AWS region to deploy the infrastructure (default: us-east-1).
- `vpc_cidr_block`: CIDR block for the VPC (default: 10.0.0.0/16).
- `public_subnet_cidr_block`: CIDR block for the public subnet (default: 10.0.1.0/24).
- `private_subnet_cidr_block`: CIDR block for the private subnet (default: 10.0.2.0/24)
- `loadbalancer_name`: Name for the Application Load Balancer. (default: web-lb1)
- `alarm_name`: Name for the CloudWatch alarm. (default:web-app-alarm)
- `evaluation_periods`: Number of evaluation Period for Autoscaling (default: 2).
- `metric_name`:  Metric Name for autoscaling group(default: HealthyHostCount).
- `namespace`: NameSpace name for autoscaling group (default: AWS/ApplicationELB)
- `period`: Cool Down Period for Scaling Policy. (default: 300)
- `alarm_description`: Alarm Description. (default:Alarm when there are not enough healthy hosts)

There are other Variables as well, please check variables.tf for there Variables Description and Default value.
# Outputs
lb_dns_name: DNS name of the Application Load Balancer.
