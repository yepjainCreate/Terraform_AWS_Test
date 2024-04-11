variable "vpc_cidr_block" {
  type = string
  description = "CIDR block for the VPC"
  //default     = "10.0.0.0/16"
}
variable "public_subnet_cidr_block" {
  type = string
  description = "CIDR block for the public subnet"
  //default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  type = string
  description = "CIDR block for the private subnet"
  //default     = "10.0.2.0/24"
}

variable "region" {
  type = string
  description = "AWS region"
  //default     = "us-east-1"
}

