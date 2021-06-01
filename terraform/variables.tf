variable "region" {
  type = "string"
}

variable "access_key" {
  type = "string"
}

variable "secret_key" {
  type = "string"
}

variable "environment" {
  type = "string"
}

variable "availability_zones" {
  type = "list"
}

variable "vpc_id" {
  type = "string"
}

variable "instances"  {
  type = "list"
  }

variable "target_groups" {
  type = "list"
}

variable "target_group_attachments" {
  type = "list"
}

variable "load_balancers" {
  type = "list"
}

variable "lb_listeners" {
  type = "list"
}
