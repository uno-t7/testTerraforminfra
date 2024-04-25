resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "${var.env}-${var.project}-vpc"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.env}-${var.project}-igw"
  }
}

resource "aws_eip" "this" {
  domain = "vpc"

  tags = {
    Name = "${var.env}-${var.project}-eip-ngw"
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id = var.subnet_id

  tags = {
    Name = "${var.env}-${var.project}-ngw"
  }
}
