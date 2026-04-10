terraform {
  backend "s3" {
    bucket         = "terraform-abhinand-12343"
    key            = "terraform/terraform.tfstate" 
    region         = "ap-south-1"
    
    # DynamoDB table for state locking
    use_lockfile   = true
    encrypt        = true # Enable server-side encryption
  }
}

