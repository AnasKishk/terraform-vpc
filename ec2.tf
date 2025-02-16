# create key_pair based on my public key to ssh web_ec2_public_subnet_1 and web_ec2_public_subnet_2
resource "aws_key_pair" "key_pair" {
  key_name   = "key_pair"
  public_key = file("~/.ssh/id_rsa_pub")
}

# create ec2 in public_subnet_1 
resource "aws_instance" "web_ec2_public_subnet_1" {
  ami                    = "ami-"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.ec2_sec_group.id] # associate the ec2_sec_group to web_ec2_public_subnet_1
  key_name               = aws_key_pair.key_pair.key_name

  tags = {
    Name = "web app public_subnet_1"
  }
}

# create security group for ec2 in public_subnet_1 
resource "aws_security_group" "ec2_sec_group" {
  name   = "ec2_sec_group"
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "ec2 sec group"
  }
}

# egress rule for the security group 
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic" {
  security_group_id = aws_security_group.ec2_sec_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# ingress rule for the security group 
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.ec2_sec_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# create ec2 in public_subnet_2
resource "aws_instance" "web_ec2_public_subnet_2" {
  ami                    = "ami-"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet_2.id
  vpc_security_group_ids = [aws_security_group.ec2_sec_group.id] # associate the ec2_sec_group to web_ec2_public_subnet_2
  key_name               = aws_key_pair.key_pair.key_name


  tags = {
    Name = "web app public_subnet_2"
  }
}

# create ec2 in private_subnet_1 
resource "aws_instance" "db_private_subnet_1" {
  ami                    = "ami-"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnet_1
  vpc_security_group_ids = [aws_security_group.ec2_sec_group.id] # associate the ec2_sec_group to db_private_subnet_1

  tags = {
    Name = "db private_subnet_1"
  }
}

# create ec2 in private_subnet_2
resource "aws_instance" "db_private_subnet_2" {
  ami                    = "ami-"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnet_2.id
  vpc_security_group_ids = [aws_security_group.ec2_sec_group.id] # associate the ec2_sec_group to db_private_subnet_2

  tags = {
    Name = "db private_subnet_2"
  }
}