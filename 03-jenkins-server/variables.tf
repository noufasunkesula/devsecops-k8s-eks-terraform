# Core Configuration

variable "region" {
  description = "The AWS region to create resources in."
  default     = "ap-south-1"
}

# Networking Configuration

variable "vpc_name" {
  description = "The name of the VPC."
  default     = "k8s-noufa-vpc"
}

variable "igw_name" {
  description = "The name of the Internet Gateway."
  default     = "k8s-noufa-igw"
}

variable "subnet_name" {
  description = "The name of the subnet."
  default     = "k8s-noufa-subnet"
}

variable "route_table_name" {
  description = "The name of the route table."
  default     = "k8s-noufa-route-table"
}

# Security

variable "security_group_name" {
  description = "The name of the security group."
  default     = "k8s-noufa-sg"
}

# Instance Configuration

variable "instance_name" {
  description = "The name of the EC2 instance."
  default     = "k8s-noufa-jenkins-server"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  default     = "t2.medium"
}

# Key Pair

variable "key_name" {
  description = "The name of the SSH key pair to access the instance."
  default     = "k8s-noufa-devsecops-key"
}

# IAM Role

variable "iam_role_name" {
  description = "The IAM role name for the Jenkins EC2 instance."
  default     = "k8s-noufa-jenkins-iam-role"
}
