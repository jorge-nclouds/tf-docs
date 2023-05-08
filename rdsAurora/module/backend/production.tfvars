bucket         = "getrev-prod-terraform-backend"
region         = "us-east-1"
key            = "storageInfra/rdsAurora/terraform.state"
dynamodb_table = "getrev-prod-terraform-backend"
#terraform init --backend-config ./config/backend/production.tfvars -reconfigure
