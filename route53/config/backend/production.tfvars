bucket         = "getrev-prod-terraform-backend"
region         = "us-east-1"
key            = "domainManagement/route53/terraform.state"
dynamodb_table = "getrev-prod-terraform-backend"
#terraform init --backend-config ./config/backend/production.tfvars -reconfigure
