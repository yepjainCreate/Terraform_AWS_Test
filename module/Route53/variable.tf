variable "region" {
  description = "AWS region"
  //default     = "us-east-1"
}
variable "vpc_id" {
  type = string
  description = "VPC ID"
}
variable "weblb_dns_name" {
  type = string
  description = "Web Loadbalancer DNS Name"
}
variable "weblb_zone_id" {
  type = string
  description = "Web Loadbalancer Zone ID"
}