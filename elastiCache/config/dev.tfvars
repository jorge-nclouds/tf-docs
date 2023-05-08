identifier = "getrev"
region     = "us-east-1"


######## Network dependencies ########
vpc_name = "get-rev-VPC-prod"

######## Redis configuration ########
engine_version             = "7.0"
cluster_name               = "redis"
cluster_size               = 2
multi_az_enabled           = true
instance_type              = "cache.t3.medium"
port                       = 6379
family                     = "redis7"
at_rest_encryption_enabled = false
transit_encryption_enabled = false
