terraform{
    required_version = "1.4.0" 

    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "4.59.0"
        }
    }


backend "s3" {
    bucket = "remote-bucket12345"
    region = "ap-south-1"
    key = "terraform/statefile/terraform.tfstate"
    dynamodb_table = "dynamodb"
}
}