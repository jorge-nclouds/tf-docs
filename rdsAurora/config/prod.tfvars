identifier = "getrev"
region     = "us-east-1"


######## Network dependencies ########
vpc_name = "get-rev-VPC-prod"

rds_cluster = [
  {
    name          = "people"
    username      = "admin"
    instance_type = "db.r5.xlarge"
    replica_count = 2
  }
]
