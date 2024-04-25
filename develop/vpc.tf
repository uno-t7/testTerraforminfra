module "vpc" {
  source = "../modules/vpc"
  
  cidr_block = "172.16.0.0/16"
  subnet_id  = module.subnet.public_a_id
  project    = var.project
  env        = var.env
}
