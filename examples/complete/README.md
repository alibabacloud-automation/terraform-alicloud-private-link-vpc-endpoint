# Complete Example

This example demonstrates how to use the `alicloud-private-link-vpc-endpoint` module to create a complete PrivateLink setup with both the VPC endpoint and its associated service.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.109.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.109.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_this"></a> [this](#module\_this) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_security_group.example](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_slb_load_balancer.example](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/slb_load_balancer) | resource |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/vpcs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_service"></a> [create\_service](#input\_create\_service) | Whether to create the VPC endpoint service. | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | The region where resources will be created. | `string` | `"cn-beijing"` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | The ID of the resource group. | `string` | `null` | no |
| <a name="input_service_resource_id"></a> [service\_resource\_id](#input\_service\_resource\_id) | The ID of the resource to associate with the endpoint service (e.g., SLB instance ID). | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_status"></a> [connection\_status](#output\_connection\_status) | The connection status of the VPC endpoint. |
| <a name="output_endpoint_domain"></a> [endpoint\_domain](#output\_endpoint\_domain) | The domain name of the VPC endpoint. |
| <a name="output_endpoint_id"></a> [endpoint\_id](#output\_endpoint\_id) | The ID of the VPC endpoint. |
| <a name="output_endpoint_name"></a> [endpoint\_name](#output\_endpoint\_name) | The name of the VPC endpoint. |
| <a name="output_endpoint_status"></a> [endpoint\_status](#output\_endpoint\_status) | The status of the VPC endpoint. |
| <a name="output_service_domain"></a> [service\_domain](#output\_service\_domain) | The domain name of the VPC endpoint service (if created). |
| <a name="output_service_id"></a> [service\_id](#output\_service\_id) | The ID of the VPC endpoint service (if created). |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | The name of the VPC endpoint service (if created). |