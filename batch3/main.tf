resource "aws_instance" "ec2" {
    ami                                  = "ami-05afd67c4a44cc983"
    availability_zone                    = "ap-south-1a"
    instance_type                        = "t2.micro"
    key_name                             = "TFkey"
    security_groups                      = [
        aws_security_group.ec2_SG.id,
    ]    
    subnet_id                            = "subnet-0b2a19a68edfa34ab"
    tags                                 = {
        "Name" = "ec2"
    }
    tags_all                             = {
        "Name" = "ec2"
    }

  }

  resource "aws_security_group" "ec2_SG" {
    description = "ec2-SG"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 22
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        },
    ]
    name        = "ec2-SG"
    vpc_id      = "vpc-0256ea3f4d3623d0f"
  }

  resource "aws_key_pair" "TFkey" {
  key_name   = "TFkey"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "TFkey" {
  content  = tls_private_key.rsa.private_key_pem 
  filename = "TFkey"
}