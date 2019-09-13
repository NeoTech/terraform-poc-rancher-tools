variable "region" {
  default = "eu-north-1"
}
variable "ami_id" {
  default = "ami-dbc04aa5"
}
variable "instance_type" {
  default = "t3.small"
}

variable "cluster_id" {
  default = "rke"
}
variable "name" {
  default = "RKE-Test-cluster"
}

variable "azs" {
  default = ["eu-north-1a"]
}

variable "private_subnets" {
  default = ["10.3.0.0/20"]
}

variable "public_subnets" {
  default = ["10.3.128.0/23"]
}

variable "cidr" {
  default = "10.3.0.0/16"
}

variable "environment" {
  type        = string
  description = "Environment name"
  default = "RKE-HA-CLUSTER"
}

