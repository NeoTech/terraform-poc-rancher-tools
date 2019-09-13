variable "region" {
  default = "eu-north-1"
}

variable "instance_type" {
  default = "t2.small"
}

variable "cluster_id" {
  default = "rke"
}
variable "name" {
  default = "RKE-Test-cluster"
}

variable "azs" {
  default = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
}

variable "private_subnets" {
  default = ["10.3.0.0/20", "10.3.16.0/20", "10.3.32.0/20"]
}

variable "public_subnets" {
  default = ["10.3.128.0/23", "10.3.130.0/23", "10.3.132.0/23"]
}

variable "cidr" {
  default = "10.3.0.0/16"
}

variable "environment" {
  type        = string
  description = "Environment name"
  default = "RKE-HA-CLUSTER"
}

