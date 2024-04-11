resource "aws_lb" "web_lb" {
  name               = var.loadbalancer_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.lb_security_groups_id]
  subnets            = [var.public_subnet_id, var.private_subnet_id]
  enable_deletion_protection = false
}
resource "aws_lb_target_group" "test" {
  name     = "testTargetgroup2"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
resource "aws_lb_listener" "weblb" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = "80"
  protocol          = "HTTP"
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = aws_acm_certificate.self-signed.arn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
  depends_on = [ aws_lb_target_group.test ]

}

