<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.4.6 |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.4.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.62.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alias_record"></a> [alias\_record](#module\_alias\_record) | ./module | n/a |
| <a name="module_non_alias_record"></a> [non\_alias\_record](#module\_non\_alias\_record) | ./module | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alias_records"></a> [alias\_records](#input\_alias\_records) | Alias records support routing traffic to specific AWS resources | <pre>list(object({<br>    name                   = string<br>    resource_dns_name      = string<br>    evaluate_target_health = bool<br>    zone_id                = string<br>  }))</pre> | `[]` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The name of the hosted zone to use | `string` | n/a | yes |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | Name of the application, used to identify resources | `string` | `"getrev"` | no |
| <a name="input_non_alias_records"></a> [non\_alias\_records](#input\_non\_alias\_records) | Non alias records to create in domain registar | <pre>list(object({<br>    name    = string<br>    records = list(string)<br>    type    = string<br>    ttl     = number<br>  }))</pre> | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | Region where resources will be deployed | `string` | `"us-east-1"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->