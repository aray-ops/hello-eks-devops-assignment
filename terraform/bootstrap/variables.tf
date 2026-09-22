variable "aws_region" {
  description = "AWS Region in which resources are created."
  type        = string
  default     = "us-east-1"
}

variable "aws_account_id" {
  description = "AWS account authorized for this project."
  type        = string
  default     = "668471253381"
}

variable "project_name" {
  description = "Project name used for resource names and tags."
  type        = string
  default     = "hello-eks-devops-assignment"
}

variable "state_bucket_name" {
  description = "Globally unique S3 bucket used for Terraform remote state."
  type        = string
  default     = "hello-eks-devops-assignment-tfstate-668471253381"
}