# AWS Lambda Password Hashing Function

A simple AWS Lambda function that hashes passwords using bcrypt.

## Dependencies

- **bcryptjs v2.4.3**: A JavaScript implementation of bcrypt for Node.js. This version provides secure password hashing with configurable salt rounds (set to 8 for balanced security and performance).

## Deployment

1. Install dependencies:
```bash
npm install
```

2. Create deployment package:
```bash
zip -r lambda-function.zip . -x "*.git*" "README.md"
```

3. Upload `lambda-function.zip` to AWS Lambda console or use AWS CLI:
```bash
aws lambda update-function-code --function-name your-function-name --zip-file fileb://lambda-function.zip
```

## Usage

Send POST request with JSON body:
```json
{
  "password": "your-password"
}
```