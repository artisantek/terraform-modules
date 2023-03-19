resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket-name
 # region = var.region
  acl = var.acl
  
 # public_access_block_configuration {
 #   block_public_acls       = true
 #   block_public_policy     = true
 #   ignore_public_acls      = true
 #   restrict_public_buckets = true
 # }

  versioning {
    enabled = var.versioning-enabled
  }

  tags = var.tags

  #bucket_key_enabled = var.bucket-key-enabled

 # object_lock_configuration {
 #   object_lock_enabled = var.object-lock-enabled
 #   rule {
 #     default_retention {
 #       mode    = "GOVERNANCE"
 #       days    = 30
 #     }
 #   }
 # }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = var.encryption-type
        kms_master_key_id = var.encryption-type == "AES256" ? null : aws_kms_key.my_key.id
      }
    }
  }
}

resource "aws_kms_key" "my_key" {
  description             = "KMS key for server-side encryption of S3 bucket"
  enable_key_rotation     = true
  deletion_window_in_days = 10
}
