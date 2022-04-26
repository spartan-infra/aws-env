provider "aws" {
  profile = "dmi-training"
  region  = "us-east-1"
}
terraform {
  required_version = ">= 1.0"
}