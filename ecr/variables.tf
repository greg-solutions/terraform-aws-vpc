variable "vpc_env" {
  description = "Name of VPC to make provisioning for. Almost all resources, created within VPC will be tagged with this value"
  type = "string"
}

variable "vpc_name_alias" {
  type = "string"
}

variable "image_tag" {
}

variable "app_env_list" {
  description = "Name of the application to provision inside VPC. Value of this variable will present in beansatlk apps, buckets, rds databsed. etc."
  type = "list"
  default = ["node"]
}
