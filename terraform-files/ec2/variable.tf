variable "region" {
    default = "ap-southeast-1"
}

variable "vpc" {
    default = "default"

}

variable "subnet" {
    default = "default public sub"

}

variable "associate_public_ip_address" {
    default = true
}

variable "key_name" {
    default = "vpc-jasnica"
}

variable "instance_type" {
    default = "t2.medium"
}

variable "ami" {
    default =  "ami-055147723b7bca09a"
  
}

variable "root_volume_size" {
    default = 8 
}

variable "instance_count" {
    default = 1
}

variable "delete_on_termination" {
    default = true
}

variable "volume_size" {
    default = 30
}

variable "volume_type" {
    default = "gp2"
}



variable "tags" {
    type = map(string)
    default = {
        "name" = "bastion-host"
        "purpose" = "control-plane"
        "env" = "stagging-prod"
        "provisionedBy" = "Terraform"
    }
}


