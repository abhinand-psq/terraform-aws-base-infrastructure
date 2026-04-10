terraform {
  backend "s3" {
    bucket         = "terraform-abhinand-12343"
    key            = "home/abhinand/terraform/terraform.tfstate" # Path to the state file in S3
    region         = "ap-south-1"
    
    # DynamoDB table for state locking
    use_lockfile   = true
    encrypt        = true # Enable server-side encryption
  }
}

