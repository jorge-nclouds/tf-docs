<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_docdb_cluster.document_db_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster) | resource |
| [aws_docdb_cluster_instance.cluster_instances](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster_instance) | resource |
| [aws_docdb_subnet_group.subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_subnet_group) | resource |
| [aws_ssm_parameter.password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_append_workspace"></a> [append\_workspace](#input\_append\_workspace) | Appends the terraform workspace at the end of resource names, <identifier>-<worspace> | `bool` | `true` | no |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. | `bool` | `false` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | The days to retain backups for | `number` | `1` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled. | `bool` | `false` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The database engine version. | `string` | `"3.6.0"` | no |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | Name of the application, used to identify resources | `string` | n/a | yes |
| <a name="input_instances_config"></a> [instances\_config](#input\_instances\_config) | Cluster instance to create within the cluster | <pre>list(object({<br>    instance_class = string<br>  }))</pre> | `[]` | no |
| <a name="input_master_password"></a> [master\_password](#input\_master\_password) | Password for the master DB user. | `string` | `null` | no |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | Username for the master DB user. | `string` | n/a | yes |
| <a name="input_port"></a> [port](#input\_port) | The port on which the DB accepts connections | `number` | `27017` | no |
| <a name="input_snapshot_identifier"></a> [snapshot\_identifier](#input\_snapshot\_identifier) | Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot. | `string` | `null` | no |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | Specifies whether the DB cluster is encrypted. | `bool` | `true` | no |
| <a name="input_subnets_id"></a> [subnets\_id](#input\_subnets\_id) | List of subnets id that cluster will use | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to the resource | `map(any)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->