terraform {
  backend "s3" {
    bucket = "dev-terraform-mayank"
        key = "state/dev/terraform.tfstate"
        region = "ap-south-1"
        }
}