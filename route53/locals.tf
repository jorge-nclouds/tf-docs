locals {
  # non alias records
  non_alias_records_keys   = [for m in var.non_alias_records : lookup(m, "name")]
  non_alias_records_values = [for m in var.non_alias_records : m]
  non_alias_records_map    = zipmap(local.non_alias_records_keys, local.non_alias_records_values)

  # alias records
  alias_records_keys   = [for m in var.alias_records : lookup(m, "name")]
  alias_records_values = [for m in var.alias_records : m]
  alias_records_map    = zipmap(local.alias_records_keys, local.alias_records_values)
}
