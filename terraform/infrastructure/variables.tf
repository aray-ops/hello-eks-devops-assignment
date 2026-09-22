variable "aws_region" {
  description = "AWS Region in which the infrastructure is deployed."
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

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"
}

variable "cluster_name" {
  description = "Name of the Amazon EKS cluster."
  type        = string
  default     = "hello-eks-devops"
}

variable "kubernetes_version" {
  description = "Kubernetes minor version used by Amazon EKS."
  type        = string
  default     = "1.35"
}

variable "vpc_cidr" {
  description = "IPv4 CIDR range assigned to the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "IPv4 CIDR range assigned to the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "IPv4 CIDR range assigned to the private subnet."
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_subnet_availability_zone" {
  description = "Availability Zone containing the public subnet."
  type        = string
  default     = "us-east-1a"
}

variable "private_subnet_availability_zone" {
  description = "Availability Zone containing the private subnet."
  type        = string
  default     = "us-east-1b"
}

variable "node_instance_types" {
  description = "EC2 instance types used by the EKS managed node groups."
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_disk_size" {
  description = "Root EBS volume size, in GiB, for each worker node."
  type        = number
  default     = 20

  validation {
    condition     = var.node_disk_size >= 20
    error_message = "The EKS worker-node disk size must be at least 20 GiB."
  }
}

variable "node_desired_size" {
  description = "Desired number of nodes in each managed node group."
  type        = number
  default     = 1
}

variable "node_min_size" {
  description = "Minimum number of nodes in each managed node group."
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum number of nodes in each managed node group."
  type        = number
  default     = 2
}