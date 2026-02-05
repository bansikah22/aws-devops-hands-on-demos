output "cloud9_environment_name" {
  description = "The name of the Cloud9 environment"
  value       = aws_cloud9_environment_ec2.dev_workstation.name
}

output "cloud9_user_access_key" {
  description = "The access key for the Cloud9 user"
  value       = aws_iam_access_key.cloud9_user_key.id
  sensitive   = true
}

output "cloud9_user_secret_key" {
  description = "The secret key for the Cloud9 user"
  value       = aws_iam_access_key.cloud9_user_key.secret
  sensitive   = true
}
