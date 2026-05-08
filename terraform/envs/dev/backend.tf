terraform {
  backend "s3" {
    bucket  = "adrian-terraform-state-dev"
    key     = "dev/terraform.tfstate"
    region  = "eu-west-1"
    encrypt = true
  }
}
