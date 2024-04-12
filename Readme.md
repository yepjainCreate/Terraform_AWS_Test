# AWS Infrastructure Deployment

This repository contains Terraform code to deploy AWS infrastructure for a web application. The infrastructure includes VPC setup, security groups, load balancer, Route 53 configuration, CloudWatch alarms, and Auto Scaling.

## Prerequisites

Before you begin, ensure you have met the following requirements:
- Install Terraform: [Terraform Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- AWS IAM Credentials: Ensure you have AWS IAM credentials configured with appropriate permissions to create resources.

## Usage

1. Clone the repository:

git clone https://github.com/yourusername/aws-infrastructure.git

2. Navigate to the repository directory:
cd aws-infrastructure

3. Initialize Terraform:
terraform init

4. Review and customize the variables in variables.tf to match your requirements.

5. Optionally, review and modify the Terraform modules in the module directory.

6 . Apply the Terraform configuration to create the infrastructure:
terraform apply

7. Confirm the changes and type yes to proceed.
8. Once the deployment is complete, you will see output including the DNS name of the load balancer.
9. To destroy the infrastructure, run:

terraform destroy

#  Terraform Modules
networking_Module: Sets up the VPC, public and private subnets.
sg_Module: Configures security groups.
certificate_Module: Manages SSL/TLS certificates.
loadBalancer_Module: Creates an Application Load Balancer.
Route53_Module: Configures Route 53 DNS records.
cloudwatch_Module: Sets up CloudWatch alarms for monitoring.
autoscaling_Module: Configures Auto Scaling policies.

# Variables
region: AWS region to deploy the infrastructure.
vpc_cidr_block: CIDR block for the VPC.
public_subnet_cidr_block: CIDR block for the public subnet.
private_subnet_cidr_block: CIDR block for the private subnet.
loadbalancer_name: Name for the Application Load Balancer.
alarm_name: Name for the CloudWatch alarm.

Other variables control various aspects of the infrastructure such as alarm settings, AMI ID, and Auto Scaling policies.

# Outputs
lb_dns_name: DNS name of the Application Load Balancer.
