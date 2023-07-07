provide "aws" {
	region = "ap-south-1"
}

module "Module-s3" {
  source = "git::https://github.com/Abhilash-HJ/terraform-modules.git//modules/create-s3"
  bucket_name = "terraformmodulescreates3abhi"
}