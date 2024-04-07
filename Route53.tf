resource "aws_route53_zone" "private_zone" {
  vpc {
    vpc_id     = aws_vpc.mainVPC.id
    vpc_region = var.region  # Change to your desired region
  }

  name = "test.example.com"
  depends_on = [ aws_vpc.mainVPC ]
}

resource "aws_route53_record" "lb_dns" {
  zone_id = aws_route53_zone.private_zone.zone_id
  name    = "test.example.com"
  type    = "A"
  //ttl     = 300
 alias {
    name                   = aws_lb.web_lb.dns_name
    zone_id                = aws_lb.web_lb.zone_id
    evaluate_target_health = true
  }
  depends_on = [ aws_route53_zone.private_zone , aws_lb.web_lb ]
}