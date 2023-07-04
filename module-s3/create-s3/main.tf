resource "aws_s3_bucket" "s3_module" {
   bucket        = var.s3_bucket_name
   force_destroy = true

}

resource "aws_s3_bucket_versioning" "versioning_s3" {
     bucket = var.versioning_enable
      versioning_configuration {
    status = "Enabled"
  }
  
}