variable "atlas" {
  description = "(Required) Details about this Atlas environment"
  type        = "map"

  default = {
    org                    = "Nutrien"
    env                    = "default-env"
    aws_region             = "us-east-2"
    aws_replication_region = "us-west-1"
  }
}

variable "aws" {
  description = "(Required) Details about this AWS account"
  type        = "map"

  default = {
    # IAM credentials for the account, optional if the env vars
    # AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY are present
    account_id = ""

    region     = ""
    access_key = ""
    secret_key = ""
    kms_key    = ""
  }
}
