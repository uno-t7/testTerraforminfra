resource "aws_subnet" "public_a" {
  vpc_id = var.vpc_id
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, 1)
  map_public_ip_on_launch = true
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "${var.env}-${var.project}-public-a"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id = var.vpc_id
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, 2)
  map_public_ip_on_launch = true
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "${var.env}-${var.project}-public-c"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id = var.vpc_id
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, 11)
  map_public_ip_on_launch = false
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "${var.env}-${var.project}-private-a"
  }
}

resource "aws_subnet" "private_c" {
  vpc_id = var.vpc_id
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, 12)
  map_public_ip_on_launch = false
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "${var.env}-${var.project}-private-c"
  }
}

resource "aws_route_table" "public_rtb" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = "${var.env}-${var.project}-public-rtb"
  }
}

resource "aws_route_table_association" "public_a_assoc" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public_rtb.id
}

resource "aws_route_table_association" "public_c_assoc" {
  subnet_id      = aws_subnet.public_c.id
  route_table_id = aws_route_table.public_rtb.id
}

resource "aws_route_table" "private_rtb" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.ngw_id
  }

  tags = {
    Name = "${var.env}-${var.project}-private-rtb"
  }
}

resource "aws_route_table_association" "private_a_assoc" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private_rtb.id
}

resource "aws_route_table_association" "private_c_assoc" {
  subnet_id      = aws_subnet.private_c.id
  route_table_id = aws_route_table.private_rtb.id
}
