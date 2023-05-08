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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rds_aurora_cluster"></a> [rds\_aurora\_cluster](#module\_rds\_aurora\_cluster) | ./module | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_subnets.data_subnets](https://registry.terraform.io/providers/hashicorp/aws/4.62.0/docs/data-sources/subnets) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/4.62.0/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_identifier"></a> [identifier](#input\_identifier) | Name of the application, used to identify resources | `string` | `"getrev"` | no |
| <a name="input_rds_cluster"></a> [rds\_cluster](#input\_rds\_cluster) | List of documentDB clusters that needs to be created | <pre>list(object({<br>    name                = string<br>    engine_version      = optional(string)<br>    port                = optional(string)<br>    password            = optional(string)<br>    username            = optional(string)<br>    instance_type       = optional(string)<br>    replica_count       = optional(number)<br>    cidr_block_ingress  = optional(list(string))<br>    snapshot_identifier = optional(string)<br>  }))</pre> | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region where resources will be deployed | `string` | `"us-east-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to the resource | `map(any)` | `{}` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | AWS VPC name where resources will be deployed | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->