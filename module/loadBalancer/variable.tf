variable "loadbalancer_name" {
  type = string
  description = "Enter the name for Load Balancer"
}

variable "lb_security_groups_id" {
  type = string
  description = "ID of lb Security group"
}

variable "private_subnet_id" {
  type = string
  description = "ID of private subnet"
}
variable "public_subnet_id" {
  type = string
  description = "ID of public subnet"
}

variable "vpc_id" {
  type = string
  description = "VPC ID"
}