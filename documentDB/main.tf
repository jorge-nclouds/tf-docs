locals {
  # document db clusters
  documentdb_cluster_keys   = [for m in var.documentdb_cluster : lookup(m, "name")]
  documentdb_cluster_values = [for m in var.documentdb_cluster : m]
  documentdb_cluster_map    = zipmap(local.documentdb_cluster_keys, local.documentdb_cluster_values)

  default_tags = {
    EnvironmentName = terraform.workspace
    OwnerName       = "GetRev"
  }
  tags = merge(local.default_tags, var.tags)
}

module "document_db_cluster" {
  for_each = toset(var.documentdb_cluster.*.name)
  source   = "./module"

  identifier              = "${var.identifier}-${each.key}"
  subnets_id              = toset(data.aws_subnets.data_subnets.ids)
  apply_immediately       = terraform.workspace == "prod" ? false : true
  backup_retention_period = terraform.workspace == "prod" ? 14 : 1
  deletion_protection     = terraform.workspace == "prod" ? true : false
  storage_encrypted       = true
  engine_version          = lookup(local.documentdb_cluster_map, each.key).engine_version == null ? "3.6.0" : lookup(local.documentdb_cluster_map, each.key).engine_version
  port                    = lookup(local.documentdb_cluster_map, each.key).port == null ? 27017 : lookup(local.documentdb_cluster_map, each.key).port
  master_password         = lookup(local.documentdb_cluster_map, each.key).master_password == null ? null : lookup(local.documentdb_cluster_map, each.key).master_password
  master_username         = lookup(local.documentdb_cluster_map, each.key).master_username == null ? null : lookup(local.documentdb_cluster_map, each.key).master_username
  snapshot_identifier     = lookup(local.documentdb_cluster_map, each.key).snapshot_identifier == null ? null : lookup(local.documentdb_cluster_map, each.key).snapshot_identifier
  instances_config        = lookup(local.documentdb_cluster_map, each.key).instances_config == null ? [] : lookup(local.documentdb_cluster_map, each.key).instances_config
  tags                    = local.tags
}
