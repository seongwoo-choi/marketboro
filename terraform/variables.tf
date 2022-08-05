variable "aws_region" {
  default = "ap-northeast-2"
}

variable "cluster-name" {
  default = "my-eks-cluster"
  type    = string
}

variable "db_username" {
  default = "hibogo789"
  type    = string
}

variable "db_password" {
  default = "MYSECRETDBPASSWORD"
  type    = string
}

variable "db_name" {
  default = "marketboro"
  type    = string
}

variable "db_port" {
  default = "3306"
  type    = string
}