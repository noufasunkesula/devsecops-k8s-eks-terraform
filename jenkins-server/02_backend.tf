terraform {
  backend "s3" {
    # 🪣 Your unique S3 bucket name
    bucket         = "k8s-noufa-bucket"

    # 🌍 Region set to Asia Pacific (Mumbai)
    region         = "ap-south-1"

    # 📁 Unique key for state file to avoid overlap
    key            = "k8s-noufa-devsecops-setup/jenkins-server/terraform.tfstate"

    # 🔒 Unique DynamoDB table name for state locking
    dynamodb_table = "k8s-noufa-logfiles"

    encrypt        = true
  }

  required_version = ">=0.13.0"

  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}
