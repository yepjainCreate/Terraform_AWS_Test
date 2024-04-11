output "vpc" {
  value = aws_vpc.mainVPC
}

output "publicSubnet" {
  value = aws_subnet.public
}

output "privateSubnet" {
  value = aws_subnet.private
}