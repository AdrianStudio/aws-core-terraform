variable "project_name" {
  description = "Tags to assign to each project"
  type        = string
}

variable "environment" {
  description = "Choose/define each enviroment"
  type        = string
}

variable "bucket_arn" {
  description = "Bucket arn to grant s3 access"
  type        = string
}
