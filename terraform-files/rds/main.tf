terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = ">=0.13.5"
}

provider "aws" {
  region = var.region
}

data "aws_security_group" "my_rds_sg" {
  filter {
    name   = "tag:Name"
    values = [var.rds_security_group]
  }
}

locals {
  vpc_id = data.aws_security_group.my_rds_sg.vpc_id
  sg_id = data.aws_security_group.my_rds_sg.id
}

data "aws_db_subnet_group" "my_subnet_group" {
  name   = "default-${local.vpc_id}"

}

resource "aws_db_instance" "mysqldb" {
  allocated_storage           = 20
  storage_type                = "gp2"
  engine                      = var.rds_engine
  engine_version              = var.rds_engine_version
  instance_class              = var.db_instance
  identifier                  = var.rds_identifier
  name                        = var.rds_db_name
  username                    = var.rds_db_username
  password                    = var.rds_db_password
  parameter_group_name        = var.rds_parameter_group_name
  db_subnet_group_name        = data.aws_db_subnet_group.my_subnet_group.name
  allow_major_version_upgrade = true
  auto_minor_version_upgrade  = true
  multi_az                    = false
  vpc_security_group_ids      = [local.sg_id]
  skip_final_snapshot         = true
  publicly_accessible         = true
  availability_zone           = var.rds_az
}