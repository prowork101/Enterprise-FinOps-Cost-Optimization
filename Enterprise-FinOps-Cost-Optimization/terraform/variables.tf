variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "enterprise-aws-finops"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "demo"
}