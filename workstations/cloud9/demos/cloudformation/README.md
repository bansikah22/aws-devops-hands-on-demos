# CloudFormation Stack Demo

This demo deploys a simple S3 bucket using AWS CloudFormation.

## Concepts

### AWS CloudFormation

AWS CloudFormation is a service that helps you model and set up your Amazon Web Services resources so that you can spend less time managing those resources and more time focusing on your applications that run in AWS. You create a template that describes all the AWS resources that you want (like Amazon EC2 instances or Amazon RDS DB instances), and CloudFormation takes care of provisioning and configuring those resources for you.

## Files

- `s3-bucket.yaml`: This is the AWS CloudFormation template that defines the S3 bucket.

### `s3-bucket.yaml`

The `s3-bucket.yaml` file contains the following:

- **AWSTemplateFormatVersion**: The version of the CloudFormation template.
- **Description**: A description of the CloudFormation template.
- **Resources**:
  - `S3Bucket`: This is the S3 bucket.
    - `Type`: `AWS::S3::Bucket`
    - `Properties`:
      - `BucketName`: The name of the S3 bucket. The name is created by substituting the `AWS::AccountId` variable into the string `my-unique-bucket-`.
- **Outputs**:
  - `BucketName`: The name of the S3 bucket.

## How to Deploy the Stack

1. **Navigate to the `cloudformation` directory:**
   ```bash
   cd workstations/cloud9/demos/cloudformation
   ```

2. **Deploy the CloudFormation stack:**
   ```bash
   aws cloudformation deploy --template-file s3-bucket.yaml --stack-name my-s3-bucket-stack
   ```
   **Expected Output:**
   ```
   Waiting for changeset to be created..
   Waiting for stack create/update to complete
   Successfully created/updated stack - my-s3-bucket-stack
   ```

3. **Update the stack:**
   To update the stack, you can modify the `s3-bucket.yaml` file and then run the `deploy` command again.

## Cleanup

To avoid incurring future charges, follow these steps to destroy the AWS resources created in this demo.

1. **Navigate to the `cloudformation` directory:**
   ```bash
   cd workstations/cloud9/demos/cloudformation
   ```

2. **Delete the CloudFormation stack:**
   ```bash
   aws cloudformation delete-stack --stack-name my-s3-bucket-stack
   ```
   **Expected Output:**
   The command will return immediately. You can check the status of the deletion in the AWS Management Console.
