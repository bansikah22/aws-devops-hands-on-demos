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

## Cleanup

To avoid incurring future charges, follow these steps to destroy the AWS resources created in this demo.

1. **Navigate to the `terraform` directory:**
   ```bash
   cd workstations/cloud9/demos/terraform
   ```

2. **Destroy the infrastructure:**
   ```bash
   terraform destroy
   ```
   **Expected Output:**
   The S3 bucket will be destroyed.

## Remote State

In a real-world scenario, you would use remote state to store the Terraform state file in a shared location, such as an S3 bucket. This allows multiple team members to collaborate on the same infrastructure. You would also use a state locking mechanism, such as a DynamoDB table, to prevent concurrent modifications to the state file.

To use remote state with S3 and DynamoDB, you first need to create the S3 bucket and the DynamoDB table.

### Create the S3 Bucket and DynamoDB Table

You can create the S3 bucket and DynamoDB table using the AWS CLI:

**Create the S3 bucket:**
```bash
aws s3 mb s3://my-terraform-state-bucket --region us-east-1
```

**Create the DynamoDB table:**
```bash
aws dynamodb create-table \
    --table-name my-terraform-state-lock-table \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --region us-east-1
```

### Configure the Backend

Once you have created the S3 bucket and DynamoDB table, you can configure the backend in your `main.tf` file:

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
The `dynamodb_table` argument is still required here, but the official documentation notes that it is for consistency. The recommended approach is to manage the DynamoDB table outside of this backend configuration.
