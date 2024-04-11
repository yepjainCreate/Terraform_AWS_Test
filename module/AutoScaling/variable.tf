variable "ami_id" {
  type = string
  description = "AMI ID for the instances"
 // default = "ami-051f8a213df8bc089"
}

variable "security_group_websg_id" {
  type = string  
  description = "Enter Web Security Group ID"
}

variable "ansible_playbook_path" {
  type = string
  description = "Local path to the Ansible playbook"
 // default = "./web_server_setup.yml"
}

variable "privateSubnetID" {
  type = string
  description = "Enter Private Subnet ID"
}

variable "autoscale_policy_name_ScaleOut" {
  type = string  
  description = "Enter scale out policy name"
}

variable "autoscale_adjustment_ScaleOut" {
  type = number
  description = "Enter scale out scaling adjustment"
}
variable "autoscale_cooldown_ScaleOut" {
  type = number
  description = "Enter scaleout cooldown period in seconds"
}

variable "autoscale_policy_name_Scalein" {
  type = string  
  description = "Enter scale in policy name"
}

variable "autoscale_adjustment_Scalein" {
  type = number
  description = "Enter scale in scaling adjustment"
}
variable "autoscale_cooldown_Scalein" {
  type = number
  description = "Enter scalein cooldown period in seconds"
}

variable "autoscale_adjustment_type" {
  type = string  
  description = "Enter auto scale policy name"
}
