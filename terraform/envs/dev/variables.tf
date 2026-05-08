variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-west-1"
}

variable "project" {
  description = "Project name used for tagging"
  type        = string
  default     = "aws-core-terraform"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}
