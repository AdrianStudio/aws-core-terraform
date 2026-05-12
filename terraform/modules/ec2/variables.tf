variable "instance_type" {
  description = "Type of instance"
  type        = string 
  default     = "t3.micro"
}

variable "project_name" {
  description = "Tags to assign to each project"
  type        = string
}

variable "environment" {
  description = "Choose/define each enviroment"
  type        = string
}

variable "subnet_id" {
  description = "Choose/define each subnet"
  type        = string
}  
