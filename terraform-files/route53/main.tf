provider "aws" {
  region = "ap-southeast-1"
}

data "aws_route53_zone" "domain" {
  name         = "jasnicahuang.xyz"
  private_zone = false
}

resource "aws_route53_zone" "subdomain" {
  name = "bp.jasnicahuang.xyz"
}

resource "aws_route53_record" "bp" {
  allow_overwrite = true
  name            = aws_route53_zone.subdomain.name
  ttl             = 172800
  type            = "NS"
  zone_id         = data.aws_route53_zone.domain.zone_id

  records = [
    aws_route53_zone.subdomain.name_servers[0],
    aws_route53_zone.subdomain.name_servers[1],
    aws_route53_zone.subdomain.name_servers[2],
    aws_route53_zone.subdomain.name_servers[3],
  ]
}