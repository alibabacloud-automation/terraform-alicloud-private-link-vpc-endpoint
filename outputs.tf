output "id" {
  description = "The ID of the VPC endpoint."
  value       = alicloud_privatelink_vpc_endpoint.this.id
}

output "name" {
  description = "The name of the VPC endpoint."
  value       = alicloud_privatelink_vpc_endpoint.this.vpc_endpoint_name
}

output "endpoint_domain" {
  description = "The domain name of the VPC endpoint."
  value       = alicloud_privatelink_vpc_endpoint.this.endpoint_domain
}

output "status" {
  description = "The status of the VPC endpoint."
  value       = alicloud_privatelink_vpc_endpoint.this.status
}

output "resource" {
  description = "The VPC endpoint resource object containing all attributes."
  value       = alicloud_privatelink_vpc_endpoint.this
}

output "endpoint_zones" {
  description = "A map of VPC endpoint zone resources with their attributes."
  value       = alicloud_privatelink_vpc_endpoint_zone.this
}

output "service_id" {
  description = "The ID of the VPC endpoint service (if created)."
  value       = var.create_endpoint_service ? join("", alicloud_privatelink_vpc_endpoint_service.this[*].id) : null
}

output "service_name" {
  description = "The name of the VPC endpoint service (if created)."
  value       = var.create_endpoint_service ? join("", alicloud_privatelink_vpc_endpoint_service.this[*].vpc_endpoint_service_name) : null
}

output "service_domain" {
  description = "The domain name of the VPC endpoint service (if created)."
  value       = var.create_endpoint_service ? join("", alicloud_privatelink_vpc_endpoint_service.this[*].service_domain) : null
}

output "service_resource" {
  description = "The VPC endpoint service resource object (if created)."
  value       = var.create_endpoint_service ? one(alicloud_privatelink_vpc_endpoint_service.this) : null
}
