resource "aws_instance" "ec2-instance" {
  ami           = "ami-05afd67c4a44cc983"
  instance_type = "t2.micro"
  key_name = "ec2-key"
  security_groups = [
    aws_security_group.ec2_SG.id,
  ]
  subnet_id = "subnet-08a46c1557c9b3fb1"

  tags = {
    Name = "ec2-instance"
  }
}
resource "aws_security_group" "ec2_SG" {
  name        = "ec2_SG"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-0069684aa03121eed"

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
  }

  tags = {
    Name = "ec2_SG"
  }
}
  

  resource "aws_key_pair" "ec2-key" {
  key_name   = "ec2-key"
  public_key = tls_private_key.rsa.public_key_openssh
}
  resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
} 
resource "local_file" "ec2-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "ec2-key"
}





