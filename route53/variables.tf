variable "identifier" {
  description = "Name of the application, used to identify resources"
  default     = "getrev"
  type        = string
}

variable "region" {
  description = "Region where resources will be deployed"
  default     = "us-east-1"
  type        = string
}

######### Domanain configuration #############
variable "domain_name" {
  description = "The name of the hosted zone to use"
  type        = string
}

variable "non_alias_records" {
  description = "Non alias records to create in domain registar"
  default     = []
  type = list(object({
    name    = string
    records = list(string)
    type    = string
    ttl     = number
  }))
}

variable "alias_records" {
  description = "Alias records support routing traffic to specific AWS resources"
  default     = []
  type = list(object({
    name                   = string
    resource_dns_name      = string
    evaluate_target_health = bool
    zone_id                = string
  }))
}
