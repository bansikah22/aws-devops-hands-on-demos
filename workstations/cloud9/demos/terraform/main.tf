provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "devops_bucket" {
  bucket = "devops-unique-terraform-bucket-12345"

  tags = {
    Name    = "My bucket"
    Owner   = "Noel Bansikah"
    Purpose = "Terraform-Demo"
  }
}

output "bucket_name" {
  description = "The name of the S3 bucket."
  value       = aws_s3_bucket.devops_bucket.bucket
}
