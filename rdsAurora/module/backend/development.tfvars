bucket         = "getrev-dev-terraform-backend"
region         = "us-east-1"
key            = "storageInfra/rdsAurora/terraform.state"
dynamodb_table = "getrev-dev-terraform-backend"
#terraform init --backend-config ./config/backend/development.tfvars -reconfigure
