resource "aws_vpc" "example" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "MyVPC"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.example.id}"
}

resource "aws_subnet" "example" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = var.subnet_cidr
  availability_zone       = "ap-south-2a"  # Change this to your preferred availability zone
  map_public_ip_on_launch = true

  tags = {
    Name = "example-subnet"
  }
}


resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.example.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  
}

resource "aws_route_table_association" "a" {
  subnet_id = "${aws_subnet.example.id}"
  route_table_id = "${aws_route_table.r.id}"
}


# Create Security Group
resource "aws_security_group" "my_security_group" {
  name        = "MySecurityGroup"
  description = "Allow inbound SSH and HTTP traffic"
  vpc_id      = aws_vpc.example.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_eip" "nat_eip" {
  depends_on = ["aws_internet_gateway.gw"]
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id     = "${aws_subnet.example.id}"

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}
