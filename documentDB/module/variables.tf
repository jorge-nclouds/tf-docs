variable "identifier" {
  description = "Name of the application, used to identify resources"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resource"
  default     = {}
  type        = map(any)
}

variable "apply_immediately" {
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window."
  default     = false
  type        = bool
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  default     = 1
  type        = number
}

variable "subnets_id" {
  description = "List of subnets id that cluster will use"
  type        = list(string)
}

variable "deletion_protection" {
  description = "A value that indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled."
  default     = false
  type        = bool
}

variable "engine_version" {
  description = "The database engine version."
  default     = "3.6.0"
  type        = string
}

variable "master_password" {
  description = "Password for the master DB user."
  default     = null
  type        = string
}

variable "master_username" {
  description = "Username for the master DB user."
  type        = string
}

variable "port" {
  description = "The port on which the DB accepts connections"
  default     = 27017
  type        = number
}

variable "snapshot_identifier" {
  description = "Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot."
  default     = null
  type        = string
}

variable "storage_encrypted" {
  description = "Specifies whether the DB cluster is encrypted."
  default     = true
  type        = bool
}

variable "append_workspace" {
  description = "Appends the terraform workspace at the end of resource names, <identifier>-<worspace>"
  default     = true
  type        = bool
}

variable "instances_config" {
  description = "Cluster instance to create within the cluster"
  default     = []
  type = list(object({
    instance_class = string
  }))
}

#enabled_cloudwatch_logs_exports - (Optional) List of log types to export to cloudwatch. If omitted, no logs will be exported. The following log types are supported: audit, profiler.
#kms_key_id - (Optional) The ARN for the KMS encryption key. When specifying kms_key_id, storage_encrypted needs to be set to true.
#preferred_backup_window - (Optional) The daily time range during which automated backups are created if automated backups are enabled using the BackupRetentionPeriod parameter.Time in UTC Default: A 30-minute window selected at random from an 8-hour block of time per regionE.g., 04:00-09:00
#preferred_maintenance_window - (Optional) The weekly time range during which system maintenance can occur, in (UTC) e.g., wed:04:00-wed:04:30
#vpc_security_group_ids - (Optional) List of VPC security groups to associate with the Cluster
