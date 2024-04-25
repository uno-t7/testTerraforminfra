module "subnet" {
  source = "../modules/subnet"

  project        = var.project
  env            = var.env
  vpc_id         = module.vpc.id
  vpc_cidr_block = module.vpc.cidr_block
  igw_id         = module.vpc.igw_id
  ngw_id         = module.vpc.ngw_id
}