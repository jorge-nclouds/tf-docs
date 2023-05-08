<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.4.6 |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.4.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.62.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.62.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_parameter_group.default](https://registry.terraform.io/providers/hashicorp/aws/4.62.0/docs/resources/elasticache_parameter_group) | resource |
| [aws_elasticache_replication_group.default](https://registry.terraform.io/providers/hashicorp/aws/4.62.0/docs/resources/elasticache_replication_group) | resource |
| [aws_elasticache_subnet_group.subnet_group](https://registry.terraform.io/providers/hashicorp/aws/4.62.0/docs/resources/elasticache_subnet_group) | resource |
| [aws_kms_alias.a](https://registry.terraform.io/providers/hashicorp/aws/4.62.0/docs/resources/kms_alias) | resource |
| [aws_kms_key.key](https://registry.terraform.io/providers/hashicorp/aws/4.62.0/docs/resources/kms_key) | resource |
| [aws_security_group.main](https://registry.terraform.io/providers/hashicorp/aws/4.62.0/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/4.62.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_cidr_blocks](https://registry.terraform.io/providers/hashicorp/aws/4.62.0/docs/resources/security_group_rule) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/4.62.0/docs/data-sources/caller_identity) | data source |
| [aws_subnets.data_subnets](https://registry.terraform.io/providers/hashicorp/aws/4.62.0/docs/data-sources/subnets) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/4.62.0/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_append_workspace"></a> [append\_workspace](#input\_append\_workspace) | Appends the terraform workspace at the end of resource names, <identifier>-<worspace> | `bool` | `true` | no |
| <a name="input_at_rest_encryption_enabled"></a> [at\_rest\_encryption\_enabled](#input\_at\_rest\_encryption\_enabled) | Enable encryption at rest | `bool` | `true` | no |
| <a name="input_auth_token"></a> [auth\_token](#input\_auth\_token) | (Optional) Password used to access a password protected server. Can be specified only if transit\_encryption\_enabled = true. | `string` | `null` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | (Optional) Specifies whether minor version engine upgrades will be applied automatically to the underlying Cache Cluster instances during the maintenance window. Only supported for engine type "redis" and if the engine version is 6 or higher. Defaults to true. | `bool` | `true` | no |
| <a name="input_automatic_failover_enabled"></a> [automatic\_failover\_enabled](#input\_automatic\_failover\_enabled) | (Optional) Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails. If enabled, num\_cache\_clusters must be greater than 1. Must be enabled for Redis (cluster mode enabled) replication groups. Defaults to false. | `bool` | `true` | no |
| <a name="input_cidr_block_ingress"></a> [cidr\_block\_ingress](#input\_cidr\_block\_ingress) | List of cidr bloks to allow ingress to RDS | `list(string)` | `[]` | no |
| <a name="input_cluster_mode_enabled"></a> [cluster\_mode\_enabled](#input\_cluster\_mode\_enabled) | Flag to enable/disable creation of a native redis cluster. `automatic_failover_enabled` must be set to `true`. | `bool` | `false` | no |
| <a name="input_cluster_mode_num_node_groups"></a> [cluster\_mode\_num\_node\_groups](#input\_cluster\_mode\_num\_node\_groups) | Number of node groups (shards) for this Redis replication group. Changing this number will trigger an online resizing operation before other settings modifications | `number` | `1` | no |
| <a name="input_cluster_mode_replicas_per_node_group"></a> [cluster\_mode\_replicas\_per\_node\_group](#input\_cluster\_mode\_replicas\_per\_node\_group) | Number of replica nodes in each node group. Valid values are 0 to 5. Changing this number will force a new resource | `number` | `0` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Redis name with the following constraints: <br>A name must contain from 1 to 20 alphanumeric characters or hyphens. <br> The first character must be a letter. <br> A name cannot end with a hyphen or contain two consecutive hyphens. | `string` | n/a | yes |
| <a name="input_cluster_size"></a> [cluster\_size](#input\_cluster\_size) | Number of nodes in cluster. *Ignored when `cluster_mode_enabled` == `true`* | `number` | `2` | no |
| <a name="input_elasticache_subnet_group_name"></a> [elasticache\_subnet\_group\_name](#input\_elasticache\_subnet\_group\_name) | Subnet group name for the ElastiCache instance | `string` | `""` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | (Optional) Version number of the cache engine to be used for the cache clusters in this replication group. If the version is 6 or higher, the major and minor version can be set, e.g., 6.2, or the minor version can be unspecified which will use the latest version at creation time, e.g., 6.x. Otherwise, specify the full version desired, e.g., 5.0.6 | `string` | `"7.0"` | no |
| <a name="input_family"></a> [family](#input\_family) | (Required) The family of the ElastiCache parameter group. | `string` | `"redis7"` | no |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | Optional) The name of your final node group (shard) snapshot. ElastiCache creates the snapshot from the primary node in the cluster. If omitted, no final snapshot will be made. | `string` | `null` | no |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | Name of the application, used to identify resources | `string` | `"getrev"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Elastic cache instance type | `string` | `"cache.t3.medium"` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | (Optional) Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Example: sun:05:00-sun:09:00 | `string` | `"sun:01:00-sun:02:00"` | no |
| <a name="input_multi_az_enabled"></a> [multi\_az\_enabled](#input\_multi\_az\_enabled) | Multi AZ (Automatic Failover must also be enabled.  If Cluster Mode is enabled, Multi AZ is on by default, and this setting is ignored) | `bool` | `false` | no |
| <a name="input_notification_topic_arn"></a> [notification\_topic\_arn](#input\_notification\_topic\_arn) | Notification topic arn | `string` | `""` | no |
| <a name="input_parameter"></a> [parameter](#input\_parameter) | A list of Redis parameters to apply. Note that parameters may differ from one Redis family to another | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_port"></a> [port](#input\_port) | Redis port | `number` | `6379` | no |
| <a name="input_preferred_cache_cluster_azs"></a> [preferred\_cache\_cluster\_azs](#input\_preferred\_cache\_cluster\_azs) | (Optional) List of EC2 availability zones in which the replication group's cache clusters will be created. The order of the availability zones in the list is considered. The first item in the list will be the primary node. Ignored when updating. | `list(string)` | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | Region where resources will be deployed | `string` | `"us-east-1"` | no |
| <a name="input_snapshot_arns"></a> [snapshot\_arns](#input\_snapshot\_arns) | A single-element string list containing an Amazon Resource Name (ARN) of a Redis RDB snapshot file stored in Amazon S3. Example: arn:aws:s3:::my\_bucket/snapshot1.rdb | `list(string)` | `[]` | no |
| <a name="input_snapshot_name"></a> [snapshot\_name](#input\_snapshot\_name) | The name of a snapshot from which to restore data into the new node group. Changing the snapshot\_name forces a new resource. | `string` | `null` | no |
| <a name="input_snapshot_window"></a> [snapshot\_window](#input\_snapshot\_window) | The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. | `string` | `"03:00-04:00"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to the resource | `map(any)` | `{}` | no |
| <a name="input_transit_encryption_enabled"></a> [transit\_encryption\_enabled](#input\_transit\_encryption\_enabled) | Set `true` to enable encryption in transit. Forced `true` if `var.auth_token` is set. | `bool` | `true` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | AWS VPC name where resources will be deployed | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->