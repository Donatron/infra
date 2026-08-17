provider "aws" {
  region = "ap-southeast-2"

  default_tags {
    tags = {
      Project   = "portfolio"
      ManagedBy = "terraform"
    }
  }
}

data "aws_caller_identity" "current" {}