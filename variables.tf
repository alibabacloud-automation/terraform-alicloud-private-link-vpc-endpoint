variable "name" {
  description = "The name of the VPC endpoint."
  type        = string
  nullable    = false
}

variable "description" {
  description = "The description of the VPC endpoint. Defaults to the endpoint name if not specified."
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "The ID of the VPC to which the endpoint belongs."
  type        = string
  nullable    = false
}

variable "service_name" {
  description = "The name of the endpoint service with which the endpoint is associated."
  type        = string
  default     = null
}

variable "service_id" {
  description = "The ID of the endpoint service with which the endpoint is associated."
  type        = string
  default     = null
}

variable "security_group_ids" {
  description = "A set of security group IDs associated with the VPC endpoint."
  type        = set(string)
  default     = []
}

variable "resource_group_id" {
  description = "The ID of the resource group to which the VPC endpoint belongs."
  type        = string
  default     = null
}

variable "dry_run" {
  description = "Whether to perform a dry run without creating the resource."
  type        = bool
  default     = false
}

variable "protected_enabled" {
  description = "Whether to enable endpoint protection."
  type        = bool
  default     = false
}

variable "policy_document" {
  description = "The RAM access policy document for the VPC endpoint."
  type        = string
  default     = null
}

variable "zone_private_ip_address_count" {
  description = "The number of private IP addresses assigned to the endpoint ENI in each zone."
  type        = number
  default     = 1
}

variable "tags" {
  description = "A map of tags to assign to the VPC endpoint."
  type        = map(string)
  default     = {}
}

variable "endpoint_zones" {
  description = "A map of endpoint zone configurations. Each zone requires a vswitch_id and zone_id."
  type = map(object({
    vswitch_id = string
    zone_id    = string
    eni_ip     = optional(string, null)
  }))
  default = {}
}

variable "bandwidth" {
  description = "The bandwidth of the endpoint connection in Mbit/s. Defaults to 1024."
  type        = number
  default     = 1024
}

variable "create_endpoint_service" {
  description = "Whether to create the VPC endpoint service. Set to false if using an existing service."
  type        = bool
  default     = false
}

variable "service_description" {
  description = "The description of the VPC endpoint service."
  type        = string
  default     = "Managed by Terraform"
}

variable "connect_bandwidth" {
  description = "The bandwidth of the connection in Mbps. Defaults to 103 Mbps."
  type        = number
  default     = 103
}

variable "auto_accept_connection" {
  description = "Whether to automatically accept connection requests. Defaults to false."
  type        = bool
  default     = false
}

variable "payer" {
  description = "The party responsible for payment. Valid values: 'Endpoint' or 'Service'. Defaults to 'Endpoint'."
  type        = string
  default     = "Endpoint"
  validation {
    condition     = contains(["Endpoint", "Service"], var.payer)
    error_message = "The payer must be either 'Endpoint' or 'Service'."
  }
}

variable "service_resource_type" {
  description = "The type of the service resource. Common values: 'slb', 'alb', 'nlb'."
  type        = string
  default     = "slb"
}

variable "service_tags" {
  description = "A map of tags to assign to the VPC endpoint service."
  type        = map(string)
  default     = {}
}

