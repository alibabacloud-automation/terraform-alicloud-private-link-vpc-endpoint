data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_security_group" "example" {
  security_group_name = "tf-example-privatelink-complete"
  vpc_id              = data.alicloud_vpcs.default.ids[0]
}

module "this" {
  source = "../.."

  name        = "tf-example-privatelink-complete"
  description = "Complete PrivateLink VPC endpoint example with integrated service"
  vpc_id      = data.alicloud_vpcs.default.ids[0]

  # Service creation parameters
  create_endpoint_service = var.create_endpoint_service

  service_description    = "Complete example VPC endpoint service"
  connect_bandwidth      = 103
  auto_accept_connection = false
  service_resource_type  = "slb"

  # Endpoint parameters
  security_group_ids = [alicloud_security_group.example.id]
  resource_group_id  = var.resource_group_id
  protected_enabled  = false

  # Additional resources
  endpoint_zones = var.endpoint_zones
  bandwidth      = var.bandwidth

  tags = {
    Environment = "complete-example"
    Project     = "privatelink"
  }
}