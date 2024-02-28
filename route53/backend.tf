terraform {
  required_version = "1.4.6"
  backend "s3" {
    bucket         = "getrev-prod-terraform-backend"
    region         = "us-east-1"
    key            = "domainManagement/route53/terraform.state"
    dynamodb_table = "getrev-prod-terraform-backend"
  }
}
