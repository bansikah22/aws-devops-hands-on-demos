variable "instance_type" {
  description = "The instance type for the Cloud9 environment"
  type        = string
  default     = "t2.micro"
}

variable "name" {
  description = "The name of the Cloud9 environment"
  type        = string
  default     = "DevOps-Workstation"
}

variable "owner" {
  description = "The owner of the Cloud9 environment"
  type        = string
  default     = "Noel Bansikah"
}

variable "aws_region" {
  description = "The AWS region to create the resources in"
  type        = string
  default     = "us-east-1"
}
