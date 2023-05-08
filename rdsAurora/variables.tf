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

variable "tags" {
  description = "Tags to be applied to the resource"
  default     = {}
  type        = map(any)
}

######## Network dependencies ########
variable "vpc_name" {
  description = "AWS VPC name where resources will be deployed"
  type        = string
}

variable "rds_cluster" {
  description = "List of documentDB clusters that needs to be created"
  type = list(object({
    name                = string
    engine_version      = optional(string)
    port                = optional(string)
    password            = optional(string)
    username            = optional(string)
    instance_type       = optional(string)
    replica_count       = optional(number)
    cidr_block_ingress  = optional(list(string))
    snapshot_identifier = optional(string)
  }))
}
