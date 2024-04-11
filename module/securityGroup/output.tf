output "lb_securityGroup" {
    value = aws_security_group.lb_sg
}

output "web_securityGroup" {
    value = aws_security_group.web_sg
}