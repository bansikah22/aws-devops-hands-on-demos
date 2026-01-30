# AWS Cloud9 – DevOps Workstation Project

This project sets up AWS Cloud9 as a reproducible DevOps workstation using Infrastructure as Code (Terraform).

## Concepts

### Infrastructure as Code (IaC)

Infrastructure as Code (IaC) is the management of infrastructure (networks, virtual machines, load balancers, and connection topology) in a descriptive model, using the same versioning as DevOps teams use for source code. Like the principle that the same source code generates the same binary, an IaC model generates the same environment every time it is applied.

### Terraform

Terraform is an open-source infrastructure as code software tool created by HashiCorp. Users define and provide data center infrastructure using a declarative configuration language known as HashiCorp Configuration Language (HCL), or optionally JSON.

### AWS Cloud9

AWS Cloud9 is a cloud-based integrated development environment (IDE) that lets you write, run, and debug your code with just a browser. It includes a code editor, debugger, and terminal. Cloud9 comes prepackaged with essential tools for popular programming languages, including JavaScript, Python, PHP, and more, so you don’t need to install files or configure your development machine to start new projects.

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
