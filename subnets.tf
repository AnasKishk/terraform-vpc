# create public_subnet_1 in us-east-1a
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr_public_1
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.region}a"

  tags = {
    Name = "public subnet 1"
  }
}
# create public_subnet_2 in us-east-1b
resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr_public_2
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.region}b"

  tags = {
    Name = "public subnet 2"
  }
}

# create private_subnet_1 in us-east-1a
resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr_private_1
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "private subnet 1"
  }
}

# create private_subnet_2 us-east-1b
resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.cidr_private_2
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "private subnet 2"
  }
}