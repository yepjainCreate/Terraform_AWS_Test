variable "alarm_name" {
  type = string
  description = "Enter the name of Alarm"
}

variable "evaluation_periods" {
  type = number
  description = "Enter the number of evaluation Period"
}
variable "metric_name" {
  type = string
  description = "Enter Metric Name"
}

variable "namespace" {
  type = string
  description = "Enter NameSpace Name"
}

variable "period" {
  type = number
  description = "Enter check time period in seconds"
}

variable "alarm_description" {
  type = string
  description = "Enter Alarm Description"
}

variable "sns_topic" {
  type = string
  description = "Enter sns Name"
}

variable "cloudwatch_log_group_name" {
  type = string
  description = "Enter cloudwatch log group name"
}

variable "cloudwatch_log_stream_name" {
  type = string
  description = "Enter cloudwatch log stream name"
}