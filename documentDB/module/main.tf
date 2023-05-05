resource "random_password" "password" {
  special = false
  length  = 22

  keepers = {
    static = "1"
  }
}

resource "aws_ssm_parameter" "password" {
  description = "DocumentDB cluster password"
  name        = "/documentdb/${local.identifier}"
  type        = "SecureString"
  value       = local.master_password
  tags        = var.tags
}


resource "aws_docdb_subnet_group" "subnet_group" {
  name       = local.identifier
  subnet_ids = var.subnets_id
  tags       = var.tags
}

resource "aws_docdb_cluster" "document_db_cluster" {
  apply_immediately       = var.apply_immediately
  backup_retention_period = var.backup_retention_period
  cluster_identifier      = local.identifier
  db_subnet_group_name    = aws_docdb_subnet_group.subnet_group.name
  deletion_protection     = var.deletion_protection
  #enabled_cloudwatch_logs_exports = ["audit", "profiler"]
  engine                    = "docdb"
  engine_version            = var.engine_version
  master_password           = var.snapshot_identifier == null ? local.master_password : null
  master_username           = var.snapshot_identifier == null ? var.master_username : null
  port                      = var.port
  final_snapshot_identifier = local.identifier
  skip_final_snapshot       = false
  snapshot_identifier       = var.snapshot_identifier
  storage_encrypted         = var.storage_encrypted
  tags                      = var.tags
}

resource "aws_docdb_cluster_instance" "cluster_instances" {
  count = length(var.instances_config)

  apply_immediately  = var.apply_immediately
  cluster_identifier = aws_docdb_cluster.document_db_cluster.id
  identifier_prefix  = local.identifier
  engine             = "docdb"
  instance_class     = var.instances_config[count.index].instance_class
  tags               = var.tags
}
