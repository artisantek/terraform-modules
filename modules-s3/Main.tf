module "s3" {
    source = "./modules/setup-s3"
    bucket-name = "module-s3-bucket"
    region = "ap-south-1"
    acl = "private"
    public-access-block = true
    versioning-enabled = "Enabled" 
    tags = {
        Name = "module-s3-setup"
    }
    object-lock-enabled = true
# note : Object lock can be Enabled  depends on bucket versioning which needs to be "enabled" to avail object lock feature
# note : Object lock can not be enabled after creating bucket 
    encryption-type = "AES256"
      
}