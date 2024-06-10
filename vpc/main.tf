resource "aws_vpc" "tnc_vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = "tnc_vpc"
  }
}
