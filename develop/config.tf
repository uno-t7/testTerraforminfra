terraform {
  required_version = "1.1.7"
  backend "s3" {
    bucket = "ssi-symmad-terraform-utworks"
    key    = "develop/terraform.tfstate"
    region = "ap-northeast-1"
  }
}