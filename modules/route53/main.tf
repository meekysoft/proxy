data "aws_route53_zone" "hosted_zone" {
  name         = var.hosted_zone_name
  private_zone = false
}

resource "aws_route53_record" "name" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = var.a_record_name
  type    = "A"
  ttl     = 60
  records = [var.a_record_ip_address]
}
