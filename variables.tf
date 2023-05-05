# Defining Region
variable "aws_region" {
  type        = string
  default     = "eu-north-1"
  description = "Set aws region"
}

variable "aws_subnet_region" {
  type        = string
  default     = "eu-north-1a"
  description = "Set vpc subnet region"
}

variable "inst_name" {
  type        = string
  default     = "MYAPP1"
  description = "Name for instance"
}

variable "aws_sec_gr" {
  type        = string
  default     = "MYAPP_secgr1"
  description = "Name for security group"
}

variable "aminame" {
  type = map(string)
  default = {
    eu-north-1 = "ami-0a6351192ce04d50c" # RedHat
  }
  description = "OS for installation"
}

variable "master_count" {
  type        = number
  default     = 2
  description = "Number of instances to deploy"
}

variable "inst_type" {
  type        = string
  default     = "t3.micro"
  description = "Set type of instance"
}

variable "key_name" {
  type        = string
  default     = "KonstHome"
  description = "Desired name of AWS key pair, ssh key loaded to AWS"
}

# Defining Private Key
variable "private_key" {
  type        = string
  default     = "~/.ssh/id_rsa"
  description = "Path to privat ssh key"
}

variable "admin_net" {
  type        = string
  default     = "22.11.33.44/32"
  description = "ip addr, or net for admin access SSH"
}

# VPC and subnets

# Defining CIDR Block for VPC
variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "Set virtual network"
  type        = string
}

# Defining CIDR Block for Subnet
variable "subnet_cidr" {
  default     = "10.0.1.0/24"
  description = "Set subnet cidr"
  type        = string
}
