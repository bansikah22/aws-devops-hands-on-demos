# Serverless "Hello API" Demo

This demo deploys a simple "Hello World" serverless application using AWS SAM.

## Concepts

### AWS SAM

The AWS Serverless Application Model (SAM) is an open-source framework for building serverless applications. It provides shorthand syntax to express functions, APIs, databases, and event source mappings. With just a few lines per resource, you can define the application you want and model it using YAML. During deployment, SAM transforms and expands the SAM syntax into AWS CloudFormation syntax, enabling you to build serverless applications faster.

### AWS Lambda

AWS Lambda is a serverless compute service that lets you run code without provisioning or managing servers, creating workload-aware cluster scaling logic, maintaining event integrations, or managing runtimes.

### Amazon API Gateway

Amazon API Gateway is a fully managed service that makes it easy for developers to create, publish, maintain, monitor, and secure APIs at any scale.

## Files

- `template.yaml`: This is the AWS SAM template that defines the resources for the serverless application.
- `hello_world/app.js`: This is the Lambda function code that returns a "Hello from Lambda!" message.

### `template.yaml`

The `template.yaml` file contains the following:

- **AWSTemplateFormatVersion**: The version of the CloudFormation template.
- **Transform**: The `AWS::Serverless-2016-10-31` transform is used to transform the SAM template into a CloudFormation template.
- **Description**: A description of the SAM template.
- **Resources**:
  - `HelloWorldFunction`: This is the AWS Lambda function.
    - `Type`: `AWS::Serverless::Function`
    - `Properties`:
      - `CodeUri`: The path to the Lambda function code.
      - `Handler`: The handler for the Lambda function.
      - `Runtime`: The runtime for the Lambda function.
      - `Architectures`: The architecture of the Lambda function.
      - `Events`:
        - `HelloWorld`: This is the API Gateway event that triggers the Lambda function.
          - `Type`: `Api`
          - `Properties`:
            - `Path`: The path for the API endpoint.
            - `Method`: The HTTP method for the API endpoint.
- **Outputs**:
  - `HelloWorldApi`: The API Gateway endpoint URL for the Hello World function.
  - `HelloWorldFunction`: The ARN of the Hello World Lambda function.
  - `HelloWorldFunctionIamRole`: The ARN of the IAM role created for the Hello World function.

### `hello_world/app.js`

The `hello_world/app.js` file contains a simple Lambda function that returns a "Hello from Lambda!" message.

## How to Deploy the Application

1. **Navigate to the `serverless` directory:**
   ```bash
   cd workstations/cloud9/demos/serverless
   ```

2. **Build the SAM application:**
   ```bash
   sam build
   ```
   **Expected Output:**
   ```
   Building function "HelloWorldFunction"
   ...
   Build Succeeded
   ```

3. **Deploy the SAM application:**
   ```bash
   sam deploy --guided
   ```
   This command will prompt you for several inputs, such as the stack name, AWS region, and whether to confirm changes before deploying.

   **Expected Output:**
   The application will be deployed, and the API Gateway endpoint URL will be displayed.

4. **Test the API endpoint:**
   You can use `curl` to test the API endpoint.
   ```bash
   curl <API Gateway endpoint URL>
   ```
   **Expected Output:**
   ```json
   {"message":"Hello from Lambda!"}
   ```

## Cleanup

To avoid incurring future charges, follow these steps to destroy the AWS resources created in this demo.

1. **Navigate to the `serverless` directory:**
   ```bash
   cd workstations/cloud9/demos/serverless
   ```

2. **Delete the CloudFormation stack:**
   ```bash
   sam delete
   ```
   **Expected Output:**
   The CloudFormation stack will be deleted.
