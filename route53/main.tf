
module "non_alias_record" {
  for_each    = toset(var.non_alias_records.*.name)
  source      = "./module"
  domain_name = var.domain_name

  name    = lookup(local.non_alias_records_map, each.key).name
  records = lookup(local.non_alias_records_map, each.key).records
  type    = lookup(local.non_alias_records_map, each.key).type
  ttl     = lookup(local.non_alias_records_map, each.key).ttl
}

module "alias_record" {
  for_each    = toset(var.alias_records.*.name)
  source      = "./module"
  domain_name = var.domain_name
  type        = "A"
  name        = each.key
  alias = [{
    name                   = lookup(local.alias_records_map, each.key).resource_dns_name
    zone_id                = lookup(local.alias_records_map, each.key).zone_id
    evaluate_target_health = lookup(local.alias_records_map, each.key).evaluate_target_health
  }]
}
