resource "alicloud_privatelink_vpc_endpoint_service" "this" {
  count = var.create_endpoint_service ? 1 : 0

  service_description    = var.service_description
  connect_bandwidth      = var.connect_bandwidth
  auto_accept_connection = var.auto_accept_connection
  payer                  = var.payer
  service_resource_type  = var.service_resource_type
  tags                   = var.service_tags
}

resource "alicloud_privatelink_vpc_endpoint" "this" {
  endpoint_description          = var.description != null ? var.description : var.name
  vpc_endpoint_name             = var.name
  resource_group_id             = var.resource_group_id
  endpoint_type                 = "Interface"
  vpc_id                        = var.vpc_id
  service_name                  = var.service_name
  service_id                    = var.create_endpoint_service ? alicloud_privatelink_vpc_endpoint_service.this[0].id : var.service_id
  dry_run                       = var.dry_run
  protected_enabled             = var.protected_enabled
  policy_document               = var.policy_document
  zone_private_ip_address_count = var.zone_private_ip_address_count
  security_group_ids            = var.security_group_ids
  tags                          = var.tags
}

resource "alicloud_privatelink_vpc_endpoint_zone" "this" {
  for_each = var.endpoint_zones

  endpoint_id = alicloud_privatelink_vpc_endpoint.this.id
  vswitch_id  = each.value.vswitch_id
  zone_id     = each.value.zone_id
  eni_ip      = each.value.eni_ip
}

resource "alicloud_privatelink_vpc_endpoint_connection" "this" {
  count = var.bandwidth != null ? 1 : 0

  endpoint_id = alicloud_privatelink_vpc_endpoint.this.id
  service_id  = alicloud_privatelink_vpc_endpoint.this.service_id
  bandwidth   = var.bandwidth
}
