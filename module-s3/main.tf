provider "aws" {
    region = "ap-south-1"
    access_key = "AKIA3D36VHA2AUBPFME3"
    secret_key = "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"
}

resource "aws_s3_bucket" "bucket" {
    bucket = "poojabuc009"  
}