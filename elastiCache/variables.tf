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

variable "append_workspace" {
  description = "Appends the terraform workspace at the end of resource names, <identifier>-<worspace>"
  default     = true
  type        = bool
}

######## Network dependencies ########
variable "vpc_name" {
  description = "AWS VPC name where resources will be deployed"
  type        = string
}

variable "cidr_block_ingress" {
  description = "List of cidr bloks to allow ingress to RDS"
  default     = []
  type        = list(string)
}

######## Redis dependencies ########
variable "cluster_name" {
  type        = string
  description = "Redis name with the following constraints: \nA name must contain from 1 to 20 alphanumeric characters or hyphens. \n The first character must be a letter. \n A name cannot end with a hyphen or contain two consecutive hyphens."
}

variable "at_rest_encryption_enabled" {
  type        = bool
  default     = true
  description = "Enable encryption at rest"
}

variable "transit_encryption_enabled" {
  type        = bool
  default     = true
  description = "Set `true` to enable encryption in transit. Forced `true` if `var.auth_token` is set."
}

variable "auth_token" {
  type        = string
  description = "(Optional) Password used to access a password protected server. Can be specified only if transit_encryption_enabled = true."
  default     = null
}

variable "auto_minor_version_upgrade" {
  description = "(Optional) Specifies whether minor version engine upgrades will be applied automatically to the underlying Cache Cluster instances during the maintenance window. Only supported for engine type \"redis\" and if the engine version is 6 or higher. Defaults to true."
  default     = true
}

variable "automatic_failover_enabled" {
  type        = bool
  default     = true
  description = "(Optional) Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails. If enabled, num_cache_clusters must be greater than 1. Must be enabled for Redis (cluster mode enabled) replication groups. Defaults to false."
}

variable "preferred_cache_cluster_azs" {
  type        = list(string)
  description = "(Optional) List of EC2 availability zones in which the replication group's cache clusters will be created. The order of the availability zones in the list is considered. The first item in the list will be the primary node. Ignored when updating."
  default     = []
}

variable "cluster_mode_replicas_per_node_group" {
  type        = number
  description = "Number of replica nodes in each node group. Valid values are 0 to 5. Changing this number will force a new resource"
  default     = 0
}

variable "cluster_mode_num_node_groups" {
  type        = number
  description = "Number of node groups (shards) for this Redis replication group. Changing this number will trigger an online resizing operation before other settings modifications"
  default     = 1
}

variable "cluster_mode_enabled" {
  type        = bool
  description = "Flag to enable/disable creation of a native redis cluster. `automatic_failover_enabled` must be set to `true`."
  default     = false
}

variable "cluster_size" {
  type        = number
  default     = 2
  description = "Number of nodes in cluster. *Ignored when `cluster_mode_enabled` == `true`*"
}

variable "engine_version" {
  type        = string
  default     = "7.0"
  description = "(Optional) Version number of the cache engine to be used for the cache clusters in this replication group. If the version is 6 or higher, the major and minor version can be set, e.g., 6.2, or the minor version can be unspecified which will use the latest version at creation time, e.g., 6.x. Otherwise, specify the full version desired, e.g., 5.0.6"
}

variable "final_snapshot_identifier" {
  type        = string
  description = "Optional) The name of your final node group (shard) snapshot. ElastiCache creates the snapshot from the primary node in the cluster. If omitted, no final snapshot will be made."
  default     = null
}

variable "maintenance_window" {
  type        = string
  default     = "sun:01:00-sun:02:00"
  description = "(Optional) Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Example: sun:05:00-sun:09:00"
}

variable "multi_az_enabled" {
  type        = bool
  default     = false
  description = "Multi AZ (Automatic Failover must also be enabled.  If Cluster Mode is enabled, Multi AZ is on by default, and this setting is ignored)"
}

variable "instance_type" {
  type        = string
  default     = "cache.t3.medium"
  description = "Elastic cache instance type"
}

variable "notification_topic_arn" {
  type        = string
  default     = ""
  description = "Notification topic arn"
}

variable "port" {
  type        = number
  default     = 6379
  description = "Redis port"
}

variable "elasticache_subnet_group_name" {
  type        = string
  description = "Subnet group name for the ElastiCache instance"
  default     = ""
}

######## Snapshots configuration ########
variable "snapshot_arns" {
  type        = list(string)
  description = "A single-element string list containing an Amazon Resource Name (ARN) of a Redis RDB snapshot file stored in Amazon S3. Example: arn:aws:s3:::my_bucket/snapshot1.rdb"
  default     = []
}

variable "snapshot_name" {
  type        = string
  description = "The name of a snapshot from which to restore data into the new node group. Changing the snapshot_name forces a new resource."
  default     = null
}

variable "snapshot_window" {
  type        = string
  description = "The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster."
  default     = "03:00-04:00"
}

######## Parameter group ########
variable "family" {
  type        = string
  default     = "redis7"
  description = "(Required) The family of the ElastiCache parameter group."
}

variable "parameter" {
  type = list(object({
    name  = string
    value = string
  }))
  default     = []
  description = "A list of Redis parameters to apply. Note that parameters may differ from one Redis family to another"
}
