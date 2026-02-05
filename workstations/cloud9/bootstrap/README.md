# Cloud9 Bootstrap Script

This script installs the necessary tools on the Cloud9 environment.

## Tools to Install
- AWS CLI (if not already available)
- Terraform
- AWS SAM CLI
- Git
- Runtime (Python or Node.js)

## How to Run the Script

1. **Upload the script to your Cloud9 environment.**

2. **Make the script executable:**
   ```bash
   chmod +x install-tools.sh
   ```

3. **Run the script:**
   ```bash
   ./install-tools.sh
   ```

**Expected Output:**
The script will install all the tools and then print out their versions.
