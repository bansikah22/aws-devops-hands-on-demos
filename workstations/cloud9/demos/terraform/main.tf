provider "aws" {
  region = "us-east-1"
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "devops_bucket" {
  bucket = "devops-unique-terraform-bucket-${random_id.bucket_suffix.hex}"

  tags = {
    Name    = "My bucket"
    Owner   = "YourName"
    Purpose = "Terraform-Demo"
  }
}

output "bucket_name" {
  description = "The name of the S3 bucket."
  value       = aws_s3_bucket.devops_bucket.bucket
}
