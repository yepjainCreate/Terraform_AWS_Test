terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
  access_key = "AKIA2OFHCDO5U4W4EKYG"
  secret_key = "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"
}

resource "aws_vpc" "mainVPC" {
  cidr_block = var.vpc_cidr_block 
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.mainVPC.id
  cidr_block        = var.public_subnet_cidr_block
  availability_zone = "${var.region}a"
  depends_on = [ aws_vpc.mainVPC ]
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.mainVPC.id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = "${var.region}b"
  depends_on = [ aws_vpc.mainVPC ]
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.mainVPC.id
  depends_on = [ aws_vpc.mainVPC ]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.mainVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}