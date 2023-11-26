variable "cluster_name" {
  type        = string
  description = "Name of EKS cluster"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of public subnet ids"
}

variable "node_group_name" {
  type        = string
  description = "Name of worker node group"
}


variable "instance_types" {
  type        = list(string)
  description = "List of ec2 worker node type"
}

variable "disk_size" {
  type        = number
  description = "Size of ec2 disk"
}

variable "ami_type" {
  type        = string
  description = "The AMI image type"
}


variable "desired_size" {
  type        = string
  description = "Desire number of worker node"
}

variable "max_size" {
  type        = string
  description = "Maximum Number of worker node"
}

variable "min_size" {
  type        = string
  description = "Minimum number of worker node "
}

variable "max_unavailable" {
  type        = string
  description = "Maximum unavailable number of worker node"
}
