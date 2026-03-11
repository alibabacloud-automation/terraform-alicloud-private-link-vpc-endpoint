# terraform-alicloud-private-link-vpc-endpoint

[English](https://github.com/alibabacloud-automation/terraform-alicloud-private-link-vpc-endpoint/blob/main/README.md) | 简体中文

在阿里云上创建[私网连接 VPC 终端节点](https://help.aliyun.com/zh/privatelink/)资源的 Terraform 模块。 该模块用于创建和管理私网连接 VPC 终端节点，支持 VPC 内的资源通过私网连接安全地访问终端节点服务。模块支持多可用区部署、安全组关联、带宽控制和策略文档配置。

## 使用方法

创建一个基础的私网连接 VPC 终端节点并关联终端节点服务。

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

## 示例

* [完整示例](https://github.com/alibabacloud-automation/terraform-alicloud-private-link-vpc-endpoint/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.109.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.109.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_privatelink_vpc_endpoint.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/privatelink_vpc_endpoint) | resource |
| [alicloud_privatelink_vpc_endpoint_connection.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/privatelink_vpc_endpoint_connection) | resource |
| [alicloud_privatelink_vpc_endpoint_service.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/privatelink_vpc_endpoint_service) | resource |
| [alicloud_privatelink_vpc_endpoint_zone.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/privatelink_vpc_endpoint_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_accept_connection"></a> [auto\_accept\_connection](#input\_auto\_accept\_connection) | Whether to automatically accept connection requests. Defaults to false. | `bool` | `false` | no |
| <a name="input_bandwidth"></a> [bandwidth](#input\_bandwidth) | The bandwidth of the endpoint connection in Mbit/s. Defaults to 1024. | `number` | `1024` | no |
| <a name="input_connect_bandwidth"></a> [connect\_bandwidth](#input\_connect\_bandwidth) | The bandwidth of the connection in Mbps. Defaults to 103 Mbps. | `number` | `103` | no |
| <a name="input_create_endpoint_service"></a> [create\_endpoint\_service](#input\_create\_endpoint\_service) | Whether to create the VPC endpoint service. Set to false if using an existing service. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the VPC endpoint. Defaults to the endpoint name if not specified. | `string` | `null` | no |
| <a name="input_dry_run"></a> [dry\_run](#input\_dry\_run) | Whether to perform a dry run without creating the resource. | `bool` | `false` | no |
| <a name="input_endpoint_zones"></a> [endpoint\_zones](#input\_endpoint\_zones) | A map of endpoint zone configurations. Each zone requires a vswitch\_id and zone\_id. | <pre>map(object({<br/>    vswitch_id = string<br/>    zone_id    = string<br/>    eni_ip     = optional(string, null)<br/>  }))</pre> | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the VPC endpoint. | `string` | n/a | yes |
| <a name="input_payer"></a> [payer](#input\_payer) | The party responsible for payment. Valid values: 'Endpoint' or 'Service'. Defaults to 'Endpoint'. | `string` | `"Endpoint"` | no |
| <a name="input_policy_document"></a> [policy\_document](#input\_policy\_document) | The RAM access policy document for the VPC endpoint. | `string` | `null` | no |
| <a name="input_protected_enabled"></a> [protected\_enabled](#input\_protected\_enabled) | Whether to enable endpoint protection. | `bool` | `false` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | The ID of the resource group to which the VPC endpoint belongs. | `string` | `null` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | A set of security group IDs associated with the VPC endpoint. | `set(string)` | `[]` | no |
| <a name="input_service_description"></a> [service\_description](#input\_service\_description) | The description of the VPC endpoint service. | `string` | `"Managed by Terraform"` | no |
| <a name="input_service_id"></a> [service\_id](#input\_service\_id) | The ID of the endpoint service with which the endpoint is associated. | `string` | `null` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The name of the endpoint service with which the endpoint is associated. | `string` | `null` | no |
| <a name="input_service_resource_type"></a> [service\_resource\_type](#input\_service\_resource\_type) | The type of the service resource. Common values: 'slb', 'alb', 'nlb'. | `string` | `"slb"` | no |
| <a name="input_service_tags"></a> [service\_tags](#input\_service\_tags) | A map of tags to assign to the VPC endpoint service. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the VPC endpoint. | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC to which the endpoint belongs. | `string` | n/a | yes |
| <a name="input_zone_private_ip_address_count"></a> [zone\_private\_ip\_address\_count](#input\_zone\_private\_ip\_address\_count) | The number of private IP addresses assigned to the endpoint ENI in each zone. | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint_domain"></a> [endpoint\_domain](#output\_endpoint\_domain) | The domain name of the VPC endpoint. |
| <a name="output_endpoint_zones"></a> [endpoint\_zones](#output\_endpoint\_zones) | A map of VPC endpoint zone resources with their attributes. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the VPC endpoint. |
| <a name="output_name"></a> [name](#output\_name) | The name of the VPC endpoint. |
| <a name="output_resource"></a> [resource](#output\_resource) | The VPC endpoint resource object containing all attributes. |
| <a name="output_service_domain"></a> [service\_domain](#output\_service\_domain) | The domain name of the VPC endpoint service (if created). |
| <a name="output_service_id"></a> [service\_id](#output\_service\_id) | The ID of the VPC endpoint service (if created). |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | The name of the VPC endpoint service (if created). |
| <a name="output_service_resource"></a> [service\_resource](#output\_service\_resource) | The VPC endpoint service resource object (if created). |
| <a name="output_status"></a> [status](#output\_status) | The status of the VPC endpoint. |
<!-- END_TF_DOCS -->

## 提交问题

如果您在使用此模块时遇到任何问题，请提交一个 [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) 并告知我们。

**注意：** 不建议在此仓库中提交问题。

## 作者

由阿里云 Terraform 团队创建和维护(terraform@alibabacloud.com)。

## 许可证

MIT 许可。有关完整详细信息，请参阅 LICENSE。

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
