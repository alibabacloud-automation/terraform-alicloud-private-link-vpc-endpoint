
variable "resource_group_id" {
  description = "The ID of the resource group."
  type        = string
  default     = null
}

variable "create_endpoint_service" {
  description = "Whether to create the VPC endpoint service."
  type        = bool
  default     = true
}

variable "endpoint_zones" {
  description = "A map of endpoint zone configurations. Each zone requires a vswitch_id and zone_id. Example:\nendpoint_zones = {\n  zone1 = {\n    vswitch_id = \"vsw-xxxxxxxxx\"\n    zone_id = \"cn-beijing-a\"\n  }\n}"
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
  default     = 2048
}