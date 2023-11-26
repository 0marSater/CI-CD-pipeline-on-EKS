module "network" {
  source               = "./Modules/Network"
  region               = var.region
  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  public_subnet_1_name = var.public_subnet_1_name
  public_subnet_1_ip   = var.public_subnet_1_ip
  public_subnet_2_name = var.public_subnet_2_name
  public_subnet_2_ip   = var.public_subnet_2_ip
  public_rt_name       = var.public_rt_name
  public_rt_cidr       = var.public_rt_cidr
}


module "eks" {
  source          = "./Modules/EKS"
  subnet_ids      = module.network.public_subnet_ids
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  instance_types  = var.instance_types
  disk_size       = var.disk_size
  ami_type        = var.ami_type
  desired_size    = var.desired_size
  max_size        = var.max_size
  min_size        = var.min_size
  max_unavailable = var.max_unavailable
}

module "jenkins" {
  source       = "./Modules/Jenkins"
  cluster_name = var.cluster_name
}