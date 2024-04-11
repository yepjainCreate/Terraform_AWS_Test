variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  type = string
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


variable "loadbalancer_name" {
  description = "Enter the name for Load Balancer"
  default     = "web-lb1"
}



variable "alarm_name" {
  type = string
  description = "Enter the name of Alarm"
  default = "web-app-alarm"
}

variable "evaluation_periods" {
  type = number
  description = "Enter the number of evaluation Period"
  default = 2
}
variable "metric_name" {
  type = string
  description = "Enter Metric Name"
  default = "HealthyHostCount"
}

variable "namespace" {
  type = string
  description = "Enter NameSpace Name"
  default = "AWS/ApplicationELB"
}

variable "period" {
  type = number
  description = "Enter check time period in seconds"
  default = 300 # 5-minute period
}

variable "alarm_description" {
  type = string
  description = "Enter Alarm Description"
  default = "Alarm when there are not enough healthy hosts"
}

variable "sns_topic" {
  type = string
  description = "Enter sns Name"
  default = "web-app-notification-topic"
}

variable "cloudwatch_log_group_name" {
  type = string
  description = "Enter cloudwatch log group name"
  default = "/var/log/web-app"
}

variable "cloudwatch_log_stream_name" {
  type = string
  description = "Enter cloudwatch log stream name"
  default = "web-app-log-stream"
}

variable "ami_id" {
  description = "AMI ID for the instances"
  default = "ami-051f8a213df8bc089"
}
variable "ansible_playbook_path" {
  description = "Local path to the Ansible playbook"
  default = "./module/AutoScaling/web_server_setup.yml"
}


variable "autoscale_policy_name_ScaleOut" {
  type = string  
  description = "Enter scale out policy name"
  default = "scale-out"
}

variable "autoscale_adjustment_ScaleOut" {
  type = number
  description = "Enter scale out scaling adjustment"
  default = 1
}
variable "autoscale_cooldown_ScaleOut" {
  type = number
  description = "Enter scaleout cooldown period in seconds"
  default = 300
}

variable "autoscale_policy_name_Scalein" {
  type = string  
  description = "Enter scale in policy name"
  default = "scale-in"
}

variable "autoscale_adjustment_Scalein" {
  type = number
  description = "Enter scale in scaling adjustment(start with -)"
  default = -1
}
variable "autoscale_cooldown_Scalein" {
  type = number
  description = "Enter scalein cooldown period in seconds"
  default = 300
}

variable "autoscale_adjustment_type" {
  type = string  
  description = "Enter auto scale policy name"
  default = "ChangeInCapacity"
}