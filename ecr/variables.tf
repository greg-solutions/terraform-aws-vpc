variable "vpc_env" {
  description = "Name of VPC to make provisioning for. Almost all resources, created within VPC will be tagged with this value"
  type = "string"
}

variable "vpc_name_alias" {
  type = "string"
}

variable "image_tag" {
}