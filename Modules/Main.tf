module "s3" {
    source = "./modules/setup-s3"
    bucket-name = "module-s3-bucket"
    region = "ap-south-1"
    acl = "private"
  #  public-access = "none"
    versioning-enabled = false
    tags = {
        Name = "module-s3-setup"
    }
    bucket-key-enabled = true
    object-lock-enabled = false
    encryption-type = "AES256"
}