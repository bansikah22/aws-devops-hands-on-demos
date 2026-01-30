# Terraform Infrastructure Demo

This demo deploys a simple S3 bucket using Terraform.

## Files

- `main.tf`: This is the Terraform configuration file that defines the S3 bucket.

### `main.tf`

The `main.tf` file contains the following:

- **Provider**: The `aws` provider is used to interact with the AWS API. The `region` is set to `us-east-1`.
- **Resource**: The `aws_s3_bucket` resource is used to create an S3 bucket.
  - `bucket`: The name of the S3 bucket.
  - `tags`: Tags to apply to the S3 bucket.
- **Output**:
  - `bucket_name`: The name of the S3 bucket.

## How to Apply the Code

1. **Navigate to the `terraform` directory:**
   ```bash
   cd workstations/cloud9/demos/terraform
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
   The S3 bucket will be created, and the `bucket_name` will be outputted.

5. **Destroy the infrastructure:**
   ```bash
   terraform destroy
   ```
   **Expected Output:**
   The S3 bucket will be destroyed.

## Remote State

In a real-world scenario, you would use remote state to store the Terraform state file in a shared location, such as an S3 bucket. This allows multiple team members to collaborate on the same infrastructure. You would also use a state locking mechanism, such as a DynamoDB table, to prevent concurrent modifications to the state file.

To configure remote state, you would add the following to your `main.tf` file:

```terraform
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "path/to/my/key"
    region         = "us-east-1"
    dynamodb_table = "my-terraform-state-lock-table"
  }
}
```
