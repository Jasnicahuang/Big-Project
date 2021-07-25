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

data "aws_vpc" "my_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc]
  }
}

data "aws_subnet" "my_subnet" {
  vpc_id = data.aws_vpc.my_vpc.id
  filter {
    name   = "tag:Name"
    values = [var.subnet]
  }
}

resource "aws_security_group" "my_sg_ec2" {
  name   = "EC2 TF SG"
  vpc_id = data.aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

}

resource "aws_instance" "my_ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.my_sg_ec2.id]
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  count                       = var.instance_count
  subnet_id                   = data.aws_subnet.my_subnet.id


  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.root_volume_size
    delete_on_termination = var.delete_on_termination
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = {
    Name          = var.tags["name"]
    Purpose       = var.tags["purpose"]
    Env           = var.tags["env"]
    ProvisionedBy = var.tags["provisionedBy"]
  }

  volume_tags = {
    Name          = var.tags["name"]
    Purpose       = var.tags["purpose"]
    Env           = var.tags["env"]
    ProvisionedBy = var.tags["provisionedBy"]
  }

  provisioner "file" {
    source      = "provision.sh"
    destination = "/tmp/provision.sh"

    connection {
      host = self.public_ip
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("/home/jasnica/aws/vpc-jasnica.pem")}"

    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/provision.sh",
      "cd /tmp/",
      "./provision.sh"
    ]

    connection {
      host = self.public_ip
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("/home/jasnica/aws/vpc-jasnica.pem")}"

    }
  }
}

