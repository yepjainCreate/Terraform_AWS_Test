resource "aws_route53_zone" "private_zone" {
  vpc {
    vpc_id     = var.vpc_id
    vpc_region = var.region  # Change to your desired region
  }

  name = "test.example.com"
}

resource "aws_route53_record" "lb_dns" {
  zone_id = aws_route53_zone.private_zone.zone_id
  name    = "test.example.com"
  type    = "A"
  //ttl     = 300
 alias {
    name                   = var.weblb_dns_name
    zone_id                = var.weblb_zone_id
    evaluate_target_health = true
  }
  depends_on = [ aws_route53_zone.private_zone ]
}