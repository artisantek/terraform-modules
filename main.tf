provider "aws" {
    region = "ap-south-1" 
}

resource "aws_instance" "example" {
    ami           = "ami-0c94855ba95c574c8"
    instance_type = "t2.micro"

    tags = {
        Name = "example-instance"
    }
}

resource "aws_eip" "example" {
  instance = aws_instance.example.id
  domain   = "vpc"   # Use the domain attribute instead of vpc
}

output "instance_public_ip" {
    value = aws_eip.example.public_ip
}

resource "aws_s3_bucket" "Terraform-s3" {
    bucket = "backend-test-12324"
    force_destroy = true

    tags = {
        Name        = "My-bucket"
    }
}

resource "aws_s3_bucket_versioning" "Terraform-s3-versioning" {
    bucket = aws_s3_bucket.Terraform-s3.bucket
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_dynamodb_table" "Terraform-dynamodb" {
    name           = "terraform-dynamodb-backend"
    billing_mode   = "PROVISIONED"
    read_capacity  = 5
    write_capacity = 5
    hash_key       = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }

    tags = {
        Name        = "backend-dynamoddb-table"
        Environment = "production"
    }
}