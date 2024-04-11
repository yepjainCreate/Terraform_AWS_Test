terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
  access_key = "AKIA2OFHCDO5U4W4EKYG"
  secret_key = "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"
}
