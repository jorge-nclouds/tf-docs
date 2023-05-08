

######## Subnet group resource ########
resource "aws_elasticache_subnet_group" "subnet_group" {
  subnet_ids = toset(data.aws_subnets.data_subnets.ids)
  name       = local.identifier
}

######## Security group resource ########
resource "aws_security_group" "main" {
  description = "security group for redis ${local.identifier}"
  vpc_id      = data.aws_vpc.vpc.id
  name        = "${local.identifier}-elasticache-sg"
  tags        = local.tags
}

resource "aws_security_group_rule" "ingress_cidr_blocks" {
  security_group_id = join("", aws_security_group.main.*.id)
  description       = "Allow inbound traffic from CIDR blocks"
  cidr_blocks       = concat([data.aws_vpc.vpc.cidr_block], var.cidr_block_ingress)
  from_port         = var.port
  protocol          = "tcp"
  to_port           = var.port
  type              = "ingress"
}

resource "aws_security_group_rule" "egress" {
  security_group_id = join("", aws_security_group.main.*.id)
  description       = "Allow all egress traffic"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  type              = "egress"
}

######## Redis resource ########
resource "aws_kms_key" "key" {
  count                   = var.at_rest_encryption_enabled ? 1 : 0
  deletion_window_in_days = 7
  enable_key_rotation     = true
  description             = "KMS key for ${local.identifier}"
  policy                  = local.kms_policy
  tags                    = local.tags
}

resource "aws_kms_alias" "a" {
  count         = var.at_rest_encryption_enabled ? 1 : 0
  target_key_id = aws_kms_key.key[0].key_id
  name          = "alias/${local.identifier}"
}

resource "aws_elasticache_parameter_group" "default" {
  name        = local.identifier
  description = "Elasticache parameter group for ${local.identifier}"
  family      = var.family

  dynamic "parameter" {
    for_each = var.cluster_mode_enabled ? concat([{ name = "cluster-enabled", value = "yes" }], var.parameter) : var.parameter
    content {
      name  = parameter.value.name
      value = tostring(parameter.value.value)
    }
  }

  tags = local.tags

  # Ignore changes to the description since it will try to recreate the resource
  lifecycle {
    ignore_changes = [
      description
    ]
  }
}

resource "aws_elasticache_replication_group" "default" {

  description                 = "Elasticache Replaication Group for ${local.identifier}"
  replication_group_id        = local.identifier
  apply_immediately           = terraform.workspace == "prod" ? false : true
  snapshot_retention_limit    = terraform.workspace == "prod" ? 14 : 1
  at_rest_encryption_enabled  = var.at_rest_encryption_enabled
  auth_token                  = var.transit_encryption_enabled ? var.auth_token : null
  transit_encryption_enabled  = var.transit_encryption_enabled || var.auth_token != null
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  automatic_failover_enabled  = var.cluster_mode_enabled ? true : var.automatic_failover_enabled
  preferred_cache_cluster_azs = length(var.preferred_cache_cluster_azs) == 0 ? null : [for n in range(0, var.cluster_size) : element(var.preferred_cache_cluster_azs, n)]
  num_node_groups             = var.cluster_mode_enabled ? var.cluster_mode_num_node_groups : null
  replicas_per_node_group     = var.cluster_mode_enabled ? var.cluster_mode_replicas_per_node_group : null
  num_cache_clusters          = var.cluster_mode_enabled ? null : var.cluster_size
  engine_version              = var.engine_version
  final_snapshot_identifier   = var.final_snapshot_identifier
  kms_key_id                  = var.at_rest_encryption_enabled ? aws_kms_key.key[0].key_id : null
  maintenance_window          = var.maintenance_window
  multi_az_enabled            = var.multi_az_enabled
  node_type                   = var.instance_type
  notification_topic_arn      = var.notification_topic_arn
  parameter_group_name        = aws_elasticache_parameter_group.default.name
  port                        = var.port
  security_group_ids          = [aws_security_group.main.id]
  snapshot_arns               = var.snapshot_arns
  snapshot_name               = var.snapshot_name
  snapshot_window             = var.snapshot_window
  subnet_group_name           = local.elasticache_subnet_group_name
  tags                        = local.tags
}
