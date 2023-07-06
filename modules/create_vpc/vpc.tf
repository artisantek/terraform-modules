resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr
  map_public_ip_on_launch = true
  availability_zone = var.subnet_zone
  tags = {
    Name = var.subnet_name
  }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
    tags = {
      "Name" = var.igw_name
    }
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.public_crt_name
  }
}

resource "aws_route_table_association" "rt_association" {
  subnet_id = aws_subnet.subnet.id
  route_table_id = aws_route_table.public_crt.id
}



