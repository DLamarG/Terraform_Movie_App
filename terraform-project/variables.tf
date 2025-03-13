# variables.tf

variable "region" {
  description = "The AWS region to deploy the resources"
  default     = "us-east-2"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_blocks" {
  description = "List of CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "security_group_name" {
  description = "Security group name"
  type        = string
  default     = "lamar-test-SG"
}
















# variable "vpc_id" {
#   description = "VPC ID to associate with the security group"
#   type        = string
# }


# variable "security_group_name" {
#   description = "Name of the security group"
#   type        = string
# }

# variable "security_group_id" {
#   description = "The ID of the security group"
#   type        = string
# }


# variable "public_subnet_1" {
#   description = "The ID of the security group"
#   type        = string
# }