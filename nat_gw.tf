# allocate aws_eip
resource "aws_eip" "eip" {
  domain = "vpc"
}

# create aws_nat_gateway
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "nat gw"
  }
}