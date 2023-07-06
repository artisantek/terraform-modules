module "my_s3_bucket" {
  source      = "s3_bucket_module/."
  bucket_name = "my-terraform-bucket"
  bucket_acl  = "private"
}