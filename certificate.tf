provider "aws" {
  region = "us-east-1"
}

resource "aws_acm_certificate" "self-signed" {
  provider = aws.us-east-1

  domain_name               = "test.example.com"
  subject_alternative_names = ["test.example.com"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}

resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.self-signed.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }
  allow_overwrite = true
  name    = each.value.name
  type    = each.value.type
  records = [each.value.record]
  ttl     = 60
  zone_id = aws_route53_zone.private_zone.zone_id
}
