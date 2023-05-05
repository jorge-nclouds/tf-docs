identifier = "getrev"
region     = "us-east-1"


######## Network dependencies ########
vpc_name = "get-rev-VPC-dev"

documentdb_cluster = [
  {
    name            = "leadcrunch-2"
    master_username = "admin"
    instances_config = [
      {
        instance_class = "db.r5.xlarge"
      }
    ]
  },
  {
    name            = "leadcrunch"
    master_username = "admin"
    instances_config = [
      {
        instance_class = "db.r5.2xlarge"
      },
      {
        instance_class = "db.r5.2xlarge"
      },
    ]
  }
]
