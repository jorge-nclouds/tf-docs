locals {
  # aurora db clusters
  rds_cluster_keys   = [for m in var.rds_cluster : lookup(m, "name")]
  rds_cluster_values = [for m in var.rds_cluster : m]
  rds_cluster_map    = zipmap(local.rds_cluster_keys, local.rds_cluster_values)

  default_tags = {
    EnvironmentName = terraform.workspace
    OwnerName       = "GetRev"
  }
  tags = merge(local.default_tags, var.tags)
}

module "rds_aurora_cluster" {
  for_each = toset(var.rds_cluster.*.name)
  source   = "./module"

  identifier                       = "${var.identifier}-${each.key}"
  final_snapshot_identifier_prefix = "${var.identifier}-${each.key}"
  subnets                          = toset(data.aws_subnets.data_subnets.ids)
  publicly_accessible              = false
  apply_immediately                = terraform.workspace == "prod" ? false : true
  backup_retention_period          = terraform.workspace == "prod" ? 14 : 1
  deletion_protection              = terraform.workspace == "prod" ? false : false
  storage_encrypted                = true
  username                         = lookup(local.rds_cluster_map, each.key).username == null ? null : lookup(local.rds_cluster_map, each.key).username
  password                         = lookup(local.rds_cluster_map, each.key).password == null ? null : lookup(local.rds_cluster_map, each.key).password
  port                             = lookup(local.rds_cluster_map, each.key).port == null ? "3306" : lookup(local.rds_cluster_map, each.key).port
  snapshot_identifier              = lookup(local.rds_cluster_map, each.key).snapshot_identifier == null ? null : lookup(local.rds_cluster_map, each.key).snapshot_identifier
  engine_version                   = lookup(local.rds_cluster_map, each.key).engine_version == null ? "5.7.mysql_aurora.2.11.1" : lookup(local.rds_cluster_map, each.key).engine_version
  instance_type                    = lookup(local.rds_cluster_map, each.key).instance_type == null ? "db.r5.xlarge" : lookup(local.rds_cluster_map, each.key).instance_type
  replica_count                    = lookup(local.rds_cluster_map, each.key).replica_count == null ? 1 : lookup(local.rds_cluster_map, each.key).replica_count
  cidr_block_ingress               = lookup(local.rds_cluster_map, each.key).cidr_block_ingress == null ? [data.aws_vpc.vpc.cidr_block] : concat([data.aws_vpc.vpc.cidr_block], lookup(local.rds_cluster_map, each.key).cidr_block_ingress)
  tags                             = local.tags
}
