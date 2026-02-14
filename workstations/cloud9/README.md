# AWS Cloud9 – DevOps Workstation Project

This project sets up AWS Cloud9 as a reproducible DevOps workstation using Infrastructure as Code (Terraform).

## Concepts

### Infrastructure as Code (IaC)

Infrastructure as Code (IaC) is the management of infrastructure (networks, virtual machines, load balancers, and connection topology) in a descriptive model, using the same versioning as DevOps teams use for source code. Like the principle that the same source code generates the same binary, an IaC model generates the same environment every time it is applied.

### Terraform

Terraform is an open-source infrastructure as code software tool created by HashiCorp. Users define and provide data center infrastructure using a declarative configuration language known as HashiCorp Configuration Language (HCL), or optionally JSON.

### AWS Cloud9

AWS Cloud9 is a cloud-based integrated development environment (IDE) that lets you write, run, and debug your code with just a browser. It includes a code editor, debugger, and terminal. Cloud9 comes prepackaged with essential tools for popular programming languages, including JavaScript, Python, PHP, and more, so you don’t need to install files or configure your development machine to start new projects.

## Permissions

When you run `terraform apply`, you may still encounter an `AccessDeniedException` error, even though the IAM user is created in the same Terraform configuration. This is because the Terraform provider is not using the newly created IAM user's credentials. The provider is configured at the beginning of the `terraform apply` command, and it cannot be changed mid-flight.

To resolve this issue, you need to run `terraform apply` in two steps:

**Step 1: Create the IAM User and Access Keys**

1.  Comment out the `aws_cloud9_environment_ec2` resource in your `main.tf` file.

    ```terraform
    # resource "aws_cloud9_environment_ec2" "dev_workstation" {
    #   instance_type = var.instance_type
    #   name          = var.name
    #   description   = "Cloud9 environment for DevOps tasks"
    #   image_id      = "amazonlinux-2-x86_64"
    #
    #   tags = {
    #     Name    = var.name
    #     Owner   = var.owner
    #     Purpose = "DevOps"
    #   }
    #
    #   depends_on = [aws_iam_user_policy_attachment.cloud9_user_attachment]
    # }
    ```

2.  Run `terraform apply` to create the IAM user and access keys.

    ```bash
    terraform apply
    ```

    The access key and secret key will be displayed as outputs.

**Step 2: Create the Cloud9 Environment**

1.  Configure your AWS provider to use the new access keys. You can do this by setting the following environment variables:

    ```bash
    export AWS_ACCESS_KEY_ID="YOUR_ACCESS_KEY"
    export AWS_SECRET_ACCESS_KEY="YOUR_SECRET_KEY"
    ```

    Replace `YOUR_ACCESS_KEY` and `YOUR_SECRET_KEY` with the values from the Terraform output.

2.  Uncomment the `aws_cloud9_environment_ec2` resource in your `main.tf` file.

3.  Run `terraform apply` again to create the Cloud9 environment.

    ```bash
    terraform apply
    ```

## Terraform Configuration

The Terraform configuration is located in the `terraform` directory and consists of the following files:

- `main.tf`: This is the main configuration file that defines the AWS Cloud9 environment.
- `variables.tf`: This file defines the variables used in the `main.tf` file.
- `outputs.tf`: This file defines the outputs of the Terraform configuration.

### `main.tf`

The `main.tf` file contains the following:

- **Provider**: The `aws` provider is used to interact with the AWS API. The `region` is set to the value of the `aws_region` variable.
- **Resource**: The `aws_cloud9_environment_ec2` resource is used to create an EC2-based Cloud9 environment. The required attributes for this resource are:
  - `instance_type`: The type of instance to connect to the environment.
  - `name`: The name of the environment.
  - `image_id`: The identifier for the Amazon Machine Image (AMI) that's used to create the EC2 instance. To choose an AMI for the instance, you must specify a valid AMI alias or a valid AWS Systems Manager (SSM) path. In this project, we are using `amazonlinux-2-x86_64`.

  The following attributes are optional but recommended:
  - `description`: The description of the environment.
  - `tags`: Tags to apply to the Cloud9 environment.

### `variables.tf`

The `variables.tf` file defines the following variables:

- `instance_type`: The instance type for the Cloud9 environment. The default value is `t2.micro`.
- `name`: The name of the Cloud9 environment. The default value is `DevOps-Workstation`.
- `owner`: The owner of the Cloud9 environment. The default value is `YourName`.
- `aws_region`: The AWS region to create the resources in. The default value is `us-east-1`.

### `outputs.tf`

The `outputs.tf` file defines the following output:

- `cloud9_environment_name`: The name of the Cloud9 environment.

## How to Apply the Code

1. **Navigate to the `terraform` directory:**
   ```bash
   cd workstations/cloud9/iac-cloud9
   ```

2. **Initialize Terraform:**
   ```bash
   terraform init
   ```
   **Expected Output:**
   ```
   Terraform has been successfully initialized!
   ```

3. **Plan the Terraform deployment:**
   ```bash
   terraform plan
   ```
   **Expected Output:**
   A plan of the resources that will be created.

4. **Apply the Terraform configuration:**
   ```bash
   terraform apply
   ```
   **Expected Output:**
   The Cloud9 environment will be created, and the `cloud9_environment_name` will be outputted.

## Cleanup

To avoid incurring future charges, follow these steps to destroy the AWS resources created in this project.

1. **Navigate to the `terraform` directory:**
   ```bash
   cd workstations/cloud9/iac-cloud9
   ```

2. **Destroy the Cloud9 environment:**
   ```bash
   terraform destroy
   ```
   **Expected Output:**
   The Cloud9 environment will be destroyed.

## Troubleshooting

### AccessDeniedException

If you are still encountering an `AccessDeniedException` error after following the two-step process for creating the IAM user and the Cloud9 environment, it is possible that your company's AWS account has a Service Control Policy (SCP) in place that is restricting access to the Cloud9 service.

**What are Service Control Policies?**

SCPs are a type of organization policy that you can use to manage permissions in your organization. SCPs offer central control over the maximum available permissions for all accounts in your organization. SCPs help you to ensure your accounts stay within your organization’s access control guidelines.

**How to Check for SCPs**

You can check for SCPs in the AWS Organizations console.

1.  Navigate to the AWS Organizations console.
2.  In the navigation pane, choose **Policies** and then choose **Service Control Policies**.
3.  Review the policies that are attached to your account's organizational unit (OU). Look for any policies that might be denying access to the Cloud9 service.

If you find an SCP that is denying access to Cloud9, you will need to contact your AWS administrator to get it updated.
