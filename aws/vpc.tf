module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> v2.0"

  name = var.name
  cidr = var.cidr

  # TODO: compute subnets automatically from CIDR based on number of available AZs
  azs = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  create_database_subnet_group = false
  enable_s3_endpoint = true

  public_subnet_tags = {
    "rke/elb"                     = "1"
    format("rke/cluster/%s", var.name) = "shared"
  }

  private_subnet_tags = {
    "rke/internal-elb"            = "1"
    format("rke/cluster/%s", var.name) = "shared"
  }

  vpc_tags = {
    format("rke/cluster/%s", var.name) = "shared"
  }

  tags = local.common_tags
}
