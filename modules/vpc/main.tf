resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = true

  tags = {
    Name = "vpc"
  }
}
