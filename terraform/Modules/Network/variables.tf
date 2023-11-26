
variable "region" {
  type        = string
  description = "Region name"
}

########################### VPC #########################

variable "vpc_cidr" {
  type        = string
  description = "VPC IP"
}


variable "vpc_name" {
  type        = string
  description = "VPC name"
}

########################### Public Subnet-1 #########################
variable "public_subnet_1_name" {
  type        = string
  description = "Public subnet-1 name"
}


variable "public_subnet_1_ip" {
  type        = string
  description = "Publuc subnet-1 ip"
}


variable "public_subnet_2_name" {
  type        = string
  description = "Public subnet-2 name"
}


variable "public_subnet_2_ip" {
  type        = string
  description = "Publuc subnet-2 ip"
}


########################### Public Route Table #########################
variable "public_rt_name" {
  type        = string
  description = "Public route table name"
}

variable "public_rt_cidr" {
  type        = string
  description = "Public route table cider block"
}



variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames."
}


variable "enable_dns_support" {
  type        = bool
  description = "Enable DNS support."
}








