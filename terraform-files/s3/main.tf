provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "devops_bucket" {
  bucket = "bp.jasnicahuang.xyz"
  acl = "private"
  
  versioning {
    enabled = true
  }

  tags = {
    Name = "bp.jasnicahuang.xyz"
  }
}

