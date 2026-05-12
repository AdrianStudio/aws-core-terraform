variable "vpc_cidr" {
  description = "CIDR block for the VPC, ip range define"
  type        = string
}

variable "project_name" {
  description = "Tags to assign to each project"
  type        = string
}

variable "environment" {
  description = "Choose/define each enviroment"
  type        = string
}


variable "public_subnet_1_cidr" {
  description = "Range of subnets"
  type = string
  default = "10.0.1.0/24"
}


variable "public_subnet_2_cidr" {
  description = "Range of subnets 2"
  type = string
  default = "10.0.2.0/24"
}

variable "private_subnet_1_cidr" {
  description = "Range of private subnets 1"
  type = string
  default = "10.0.3.0/24"
}


variable "private_subnet_2_cidr" {
  description = "Range of private subnets 2"
  type = string
  default = "10.0.4.0/24"
}
