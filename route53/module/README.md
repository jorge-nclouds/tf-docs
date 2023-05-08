<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alias"></a> [alias](#input\_alias) | Alias records support routing traffic to specific AWS resources | <pre>list(object({<br>    evaluate_target_health = bool,<br>    zone_id                = string,<br>    name                   = string<br>  }))</pre> | `[]` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The name of the hosted zone to use | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the record | `string` | n/a | yes |
| <a name="input_private_zone"></a> [private\_zone](#input\_private\_zone) | Whether this is a private hosted zone or not (defaults to false) | `bool` | `false` | no |
| <a name="input_records"></a> [records](#input\_records) | (Required for non-alias records) A string list of records | `list(string)` | `null` | no |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | (Required for non-alias records) The TTL of the record | `number` | `null` | no |
| <a name="input_type"></a> [type](#input\_type) | The record type. Valid values are A, AAAA, CAA, CNAME, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT | `string` | `"A"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->