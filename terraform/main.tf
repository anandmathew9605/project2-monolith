module "vpc" {
  source = "./modules/1-vpc"
}

module "subnet" {
  source = "./modules/2-subnet"
  vpc_id = var.vpc_id
}

/*module "eip" {
  source = "./modules/3-eip"
}*/

module "igw" {
  source = "./modules/4-igw"
  vpc_id = var.vpc_id
}

/*module "natgw" {
  source = "./modules/5-natgw"
  vpc_id = var.vpc_id
}*/

module "route_table" {
  source = "./modules/6-route_table"
  vpc_id = var.vpc_id
  igw    = var.igw
  natgw1 = var.natgw1
  natgw2 = var.natgw2
}

/*module "security_groups" {
 source = "./modules/7-security_group" 
 vpc_id = var.vpc_id
}*/

module "compute" {
  source = "./modules/8-compute"
}

module "load_balancer" {
  source = "./modules/9-load_balancer"
  vpc_id = var.vpc_id
}

/*module "kms_key" {
  source = "./modules/10-kms_key"
}*/

/*module "database" {
  source = "./modules/12-database"
}*/