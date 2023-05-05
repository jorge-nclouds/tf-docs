terraform {
  required_version = "1.3.9"
  backend "s3" {
    bucket         = "getrev-prod-terraform-backend"
    region         = "us-east-1"
    key            = "prod/storageInfra/documentDB/terraform.state"
    dynamodb_table = "getrev-prod-terraform-backend"
  }
}