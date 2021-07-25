variable "region" {
default = "ap-southeast-1"
}

variable "db_instance" {
  default = "db.t2.micro"
}

variable "rds_engine" {
  default = "mysql"
}

variable "rds_engine_version" {
  default = "5.7.33"
}

variable "rds_identifier" {
  default = "dbcilsy"
}

variable "rds_db_name" {
  default = "pesbukprod"
}

variable "rds_db_username" {
  default = "admin"
}

variable "rds_db_password" {
  default = "bulbasaur"
}

variable "rds_parameter_group_name" {
  default = "default.mysql5.7"
}

variable "rds_subnet_group" {
  default = "default-vpc-dd5e9bbb"
}

variable "rds_security_group" {
  default = "k8s-rd-sg"
}

variable "rds_az" {
    default = "ap-southeast-1a"
}
