variable "region" {
  description = "AWS region"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, uat, prd)"
  type        = string

  validation {
    condition     = contains(["dev", "uat", "prd"], var.environment)
    error_message = "environment must be one of: dev, uat, prd."
  }
}

variable "instance_name" {
  description = "Base name for the EC2 instance(s)"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "instance_count" {
  description = "Number of instances"
  type        = number
}

variable "root_volume_size" {
  description = "Root EBS volume size in GB"
  type        = number
}

variable "key_name" {
  description = "Existing EC2 key pair name, or null to launch without one."
  type        = string
}

variable "tags" {
  description = "Extra tags applied to all resources"
  type        = map(string)
}
