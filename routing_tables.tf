# create public_route_table for public_subnet_1 and public_subnet_2
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "public route table"
  }
}

# route for public_route_table (to igw)
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# associate public_route_table to public_subnet_1
resource "aws_route_table_association" "route_table_association_public_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

# associate public_route_table to public_subnet_2
resource "aws_route_table_association" "route_table_association_public_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}

# create private_route_table for private_subnet_1 and private_subnet_2
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "private route table"
  }
}

# route for private_route_table (to nat_gw)
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw.id
}

# associate private_route_table to private_subnet_1
resource "aws_route_table_association" "route_table_association_private_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}

# associate private_route_table to private_subnet_2
resource "aws_route_table_association" "route_table_association_private_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}