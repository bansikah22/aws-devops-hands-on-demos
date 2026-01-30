output "cloud9_environment_name" {
  description = "The name of the Cloud9 environment"
  value       = aws_cloud9_environment_ec2.dev_workstation.name
}
