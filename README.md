# terraform-alicloud-private-link-vpc-endpoint

English | [简体中文](https://github.com/alibabacloud-automation/terraform-alicloud-private-link-vpc-endpoint/blob/main/README-CN.md)

Terraform module which creates [PrivateLink VPC Endpoint](https://www.alibabacloud.com/help/en/privatelink/) resources on Alibaba Cloud.

This module provides the ability to create and manage PrivateLink VPC Endpoints, enabling VPC resources to securely access endpoint services through private network connections. It supports multi-zone deployment, security group association, bandwidth control, and policy document configuration.

## Usage

Create a basic PrivateLink VPC Endpoint associated with an endpoint service.

```terraform
module "this" {
  source  = "alibabacloud-automation/private-link-vpc-endpoint/alicloud"

  name               = "my-vpc-endpoint"
  vpc_id             = "vpc-xxxxxxxxx"
  service_id         = "epsrv-xxxxxxxxx"
  security_group_ids = ["sg-xxxxxxxxx"]

  endpoint_zones = {
    zone_a = {
      vswitch_id = "vsw-xxxxxxxxx"
      zone_id    = "cn-hangzhou-h"
    }
  }

  tags = {
    Environment = "production"
  }
}
```

## Examples

* [Basic Example](https://github.com/alibabacloud-automation/terraform-alicloud-private-link-vpc-endpoint/tree/main/examples/basic)
* [Advanced Example](https://github.com/alibabacloud-automation/terraform-alicloud-private-link-vpc-endpoint/tree/main/examples/advanced)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.109.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | 1.272.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_privatelink_vpc_endpoint.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/privatelink_vpc_endpoint) | resource |
| [alicloud_privatelink_vpc_endpoint_connection.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/privatelink_vpc_endpoint_connection) | resource |
| [alicloud_privatelink_vpc_endpoint_zone.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/privatelink_vpc_endpoint_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bandwidth"></a> [bandwidth](#input\_bandwidth) | The bandwidth of the endpoint connection in Mbit/s. Defaults to 1024. | `number` | `1024` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the VPC endpoint. Defaults to the endpoint name if not specified. | `string` | `null` | no |
| <a name="input_dry_run"></a> [dry\_run](#input\_dry\_run) | Whether to perform a dry run without creating the resource. | `bool` | `false` | no |
| <a name="input_endpoint_zones"></a> [endpoint\_zones](#input\_endpoint\_zones) | A map of endpoint zone configurations. Each zone requires a vswitch\_id and zone\_id. | <pre>map(object({<br/>    vswitch_id = string<br/>    zone_id    = string<br/>    eni_ip     = optional(string, null)<br/>  }))</pre> | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the VPC endpoint. | `string` | n/a | yes |
| <a name="input_policy_document"></a> [policy\_document](#input\_policy\_document) | The RAM access policy document for the VPC endpoint. | `string` | `null` | no |
| <a name="input_protected_enabled"></a> [protected\_enabled](#input\_protected\_enabled) | Whether to enable endpoint protection. | `bool` | `false` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | The ID of the resource group to which the VPC endpoint belongs. | `string` | `null` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | A set of security group IDs associated with the VPC endpoint. | `set(string)` | `[]` | no |
| <a name="input_service_id"></a> [service\_id](#input\_service\_id) | The ID of the endpoint service with which the endpoint is associated. | `string` | `null` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The name of the endpoint service with which the endpoint is associated. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the VPC endpoint. | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC to which the endpoint belongs. | `string` | n/a | yes |
| <a name="input_zone_private_ip_address_count"></a> [zone\_private\_ip\_address\_count](#input\_zone\_private\_ip\_address\_count) | The number of private IP addresses assigned to the endpoint ENI in each zone. | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_status"></a> [connection\_status](#output\_connection\_status) | The connection status of the VPC endpoint. |
| <a name="output_endpoint_domain"></a> [endpoint\_domain](#output\_endpoint\_domain) | The domain name of the VPC endpoint. |
| <a name="output_endpoint_zones"></a> [endpoint\_zones](#output\_endpoint\_zones) | A map of VPC endpoint zone resources with their attributes. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the VPC endpoint. |
| <a name="output_name"></a> [name](#output\_name) | The name of the VPC endpoint. |
| <a name="output_resource"></a> [resource](#output\_resource) | The VPC endpoint resource object containing all attributes. |
| <a name="output_status"></a> [status](#output\_status) | The status of the VPC endpoint. |
<!-- END_TF_DOCS -->

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
