variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] ."
}

variable "name" {
  type    = string
  default = ""
}

variable "network" {
  type        = string
  default     = ""
  description = "(Required) The VPC network the subnets belong to. Only networks that are in the distributed mode can have subnetworks."
}

variable "project_id" {
  type        = string
  default     = ""
  description = "(Optional) The ID of the project in which the resource belongs. If it is not set, the provider project is used."
}

variable "private_ip_google_access" {
  type        = bool
  default     = true
  description = "(Optional) When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access."
}

variable "ip_cidr_range" {
  type        = string
  default     = "10.10.0.0/24"
  description = "(Required) The range of internal addresses that are owned by this subnetwork. Provide this property when you create the subnetwork. For example, 10.0.0.0/8 or 192.168.0.0/16. Ranges must be unique and non-overlapping within a network. Only IPv4 is supported."
}

variable "secondary_ip_ranges" {
  type        = any
  default     = []
  description = "An array of configurations for secondary IP ranges for VM instances contained in this subnetwork. The primary IP of such VM must belong to the primary ipCidrRange of the subnetwork. The alias IPs may belong to either primary or secondary ranges."
}

variable "log_config" {
  type        = any
  default     = null
  description = "(Optional) Logging options for the subnetwork flow logs. Setting this value to 'null' will disable them. See https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html for more information and examples."
}

variable "google_compute_subnetwork_enabled" {
  type    = bool
  default = true
}

variable "module_enabled" {
  type    = bool
  default = true
}

variable "module_timeouts" {
  type        = any
  default     = {}
  description = "(Optional) How long certain operations (per resource type) are allowed to take before being considered to have failed."
}

variable "gcp_region" {
  type        = string
  default     = "europe-west3"
  description = "Google Cloud region"
}