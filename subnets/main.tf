resource "aws_subnet" "tnc_subnet_1" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.0.0/28"
  availability_zone = "us-west-2a"
  tags = {
    Name = "tnc_subnet_1"
  }
}

resource "aws_subnet" "tnc_subnet_2" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.0.16/28"
  availability_zone = "us-west-2b"
  tags = {
    Name = "tnc_subnet_2"
  }
}
