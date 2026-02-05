# AWS CLI S3 Bucket Demo

This demo shows how to create and delete an S3 bucket using the AWS CLI.

## Concepts

### AWS Command Line Interface (CLI)

The AWS Command Line Interface (CLI) is a unified tool to manage your AWS services. With just one tool to download and configure, you can control multiple AWS services from the command line and automate them through scripts.

## How to Create an S3 Bucket

1. **Choose a unique bucket name.**
   S3 bucket names must be globally unique. Choose a name that is unlikely to be used by anyone else.

2. **Create the S3 bucket:**
   ```bash
   aws s3 mb s3://YOUR_UNIQUE_BUCKET_NAME
   ```
   Replace `YOUR_UNIQUE_BUCKET_NAME` with the name you chose in the previous step.

   **Expected Output:**
   ```
   make_bucket: s3://your-unique-bucket-name/
   ```

## Cleanup

To avoid incurring future charges, follow these steps to destroy the AWS resources created in this demo.

1. **Delete the S3 bucket:**
   ```bash
   aws s3 rb s3://YOUR_UNIQUE_BUCKET_NAME
   ```
   Replace `YOUR_UNIQUE_BUCKET_NAME` with the name of your bucket.

   **Expected Output:**
   ```
   remove_bucket: s3://your-unique-bucket-name/
   ```
