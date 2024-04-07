variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  description = "CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "ami_id" {
  description = "AMI ID for the instances"
  default = "ami-051f8a213df8bc089"
}
variable "ansible_playbook_path" {
  description = "Local path to the Ansible playbook"
  default = "./web_server_setup.yml"
}