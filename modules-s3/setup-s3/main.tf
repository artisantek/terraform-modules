resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket-name
  object_lock_enabled = var.object-lock-enabled
  tags = {
    Environment = "Dev"
  }
  
}

resource "aws_s3_bucket_acl" "ACL" {
  bucket = aws_s3_bucket.bucket.id
  acl    = var.acl
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = var.versioning-enabled
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = var.public-access-block
  block_public_policy     = var.public-access-block
  ignore_public_acls      = var.public-access-block
  restrict_public_buckets = var.public-access-block
}

resource "aws_s3_bucket_object_lock_configuration" "object_lock" {
   bucket = aws_s3_bucket.bucket.id
   depends_on = [ aws_s3_bucket_versioning.versioning ]
    rule {
     default_retention {
       mode = "GOVERNANCE"
       days = 10
     }
   }
 }

resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.bucket.id
  depends_on = [
    aws_kms_key.mykey
  ]
  
  rule {
    apply_server_side_encryption_by_default {
        sse_algorithm     = var.encryption-type
        kms_master_key_id = var.encryption-type == "AES256" ? null : aws_kms_key.mykey.arn
      }
    }
  }
