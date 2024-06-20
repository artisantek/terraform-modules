# Terraform Modules

This repository contains Terraform modules for setting up AWS resources.

## Modules

### S3 Bucket

Module for creating an S3 bucket with optional versioning.

#### Inputs
- `bucket_name`: The name of the S3 bucket.
- `force_destroy`: A boolean to indicate if all objects should be deleted when destroying the bucket.
- `versioning_status`: The versioning status of the bucket.

#### Outputs
- `bucket_id`: The ID of the S3 bucket.
- `bucket_arn`: The ARN of the S3 bucket.

### DynamoDB Table

Module for creating a DynamoDB table.

#### Inputs
- `table_name`: The name of the DynamoDB table.
- `billing_mode`: The billing mode of the table.
- `read_capacity`: The number of read capacity units.
- `write_capacity`: The number of write capacity units.
- `hash_key`: The attribute to use as the hash key.

#### Outputs
- `table_id`: The ID of the DynamoDB table.
- `table_arn`: The ARN of the DynamoDB table.

