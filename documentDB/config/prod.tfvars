identifier = "getrev"
region     = "us-east-1"


######## Network dependencies ########
vpc_name = "get-rev-VPC-prod"

documentdb_cluster = [
  {
    name            = "leadcrunch"
    master_username = "admin"
    #engine_version  = "4.0.0"
    instances_config = [
      {
        instance_class = "db.r5.2xlarge"
      },
      {
        instance_class = "db.r5.xlarge"
      },
    ]
  }
]
