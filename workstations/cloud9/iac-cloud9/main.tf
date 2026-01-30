provider "aws" {
  region = var.aws_region
}

resource "aws_cloud9_environment_ec2" "dev_workstation" {
  instance_type = var.instance_type
  name          = var.name
  description   = "Cloud9 environment for DevOps tasks"
  image_id      = "amazonlinux-2-x86_64"

  tags = {
    Name    = var.name
    Owner   = var.owner
    Purpose = "DevOps"
  }
}
