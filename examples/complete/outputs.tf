output "endpoint_id" {
  description = "The ID of the VPC endpoint."
  value       = module.this.id
}

output "endpoint_name" {
  description = "The name of the VPC endpoint."
  value       = module.this.name
}

output "endpoint_domain" {
  description = "The domain name of the VPC endpoint."
  value       = module.this.endpoint_domain
}

output "endpoint_status" {
  description = "The status of the VPC endpoint."
  value       = module.this.status
}

output "service_id" {
  description = "The ID of the VPC endpoint service (if created)."
  value       = module.this.service_id
}

output "service_name" {
  description = "The name of the VPC endpoint service (if created)."
  value       = module.this.service_name
}

output "service_domain" {
  description = "The domain name of the VPC endpoint service (if created)."
  value       = module.this.service_domain
}