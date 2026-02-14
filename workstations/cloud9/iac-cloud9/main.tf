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

  depends_on = [aws_iam_user_policy_attachment.cloud9_user_attachment]
}

resource "aws_iam_user" "cloud9_user" {
  name = "cloud9-user"
}

resource "aws_iam_user_policy_attachment" "cloud9_user_attachment" {
  user       = aws_iam_user.cloud9_user.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCloud9Administrator"
}

resource "aws_iam_access_key" "cloud9_user_key" {
  user = aws_iam_user.cloud9_user.name
}
