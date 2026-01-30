import boto3

def list_buckets():
    """
    Lists all S3 buckets in the account.
    """
    try:
        s3 = boto3.client('s3')
        response = s3.list_buckets()

        print("Existing buckets:")
        for bucket in response['Buckets']:
            print(f"  {bucket['Name']}")
    except Exception as e:
        print(f"Error listing buckets: {e}")

if __name__ == "__main__":
    list_buckets()
