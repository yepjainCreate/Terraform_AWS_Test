resource "aws_lb" "web_lb" {
  name               = "web-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [aws_subnet.public.id, aws_subnet.private.id]
  enable_deletion_protection = false    
  depends_on = [ aws_security_group.lb_sg , aws_subnet.public  ]
}
resource "aws_lb_target_group" "test" {
  name     = "testTargetgroup1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.mainVPC.id
  depends_on = [ aws_vpc.mainVPC ]
}
resource "aws_lb_listener" "weblb" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.self-signed.arn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
  depends_on = [ aws_acm_certificate.self-signed , aws_lb_target_group.test ]

}

