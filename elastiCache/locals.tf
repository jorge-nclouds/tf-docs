locals {
  identifier = var.append_workspace ? "${var.identifier}-${var.cluster_name}-${terraform.workspace}" : "${var.identifier}-${var.cluster_name}"
  default_tags = {
    EnvironmentName = terraform.workspace
    OwnerName       = "GetRev"
  }
  tags = merge(local.default_tags, var.tags)

  kms_policy = <<EOF
{
 "Version": "2012-10-17",
    "Id": "key-default-1",
    "Statement": [
        {
            "Sid": "Enable IAM User Permissions",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
            },
            "Action": "kms:*",
            "Resource": "*"
        }    
    ]
}
EOF

  elasticache_subnet_group_name = var.elasticache_subnet_group_name != "" ? var.elasticache_subnet_group_name : join("", aws_elasticache_subnet_group.subnet_group.*.name)
}
