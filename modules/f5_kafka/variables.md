<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_bigip"></a> [bigip](#requirement\_bigip) | 1.19.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_bigip"></a> [bigip](#provider\_bigip) | 1.19.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [bigip_ltm_pool.pool](https://registry.terraform.io/providers/F5Networks/bigip/1.19.0/docs/resources/ltm_pool) | resource |
| [bigip_ltm_pool_attachment.attachment](https://registry.terraform.io/providers/F5Networks/bigip/1.19.0/docs/resources/ltm_pool_attachment) | resource |
| [bigip_ltm_virtual_server.tcp](https://registry.terraform.io/providers/F5Networks/bigip/1.19.0/docs/resources/ltm_virtual_server) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Name of application. <app>-<cluster#>-<project>-<env>  like kafka-1-toyota-dev etc | `string` | n/a | yes |
| <a name="input_f5_address"></a> [f5\_address](#input\_f5\_address) | ## variables for provider.tf | `any` | n/a | yes |
| <a name="input_f5_password"></a> [f5\_password](#input\_f5\_password) | n/a | `any` | n/a | yes |
| <a name="input_f5_username"></a> [f5\_username](#input\_f5\_username) | n/a | `any` | n/a | yes |
| <a name="input_load_balancing_mode"></a> [load\_balancing\_mode](#input\_load\_balancing\_mode) | Specifies the load balancing method. The default is Round Robin | `string` | `"round-robin"` | no |
| <a name="input_ltm_node_connection_limit"></a> [ltm\_node\_connection\_limit](#input\_ltm\_node\_connection\_limit) | n/a | `number` | `0` | no |
| <a name="input_ltm_node_dynamic_ratio"></a> [ltm\_node\_dynamic\_ratio](#input\_ltm\_node\_dynamic\_ratio) | n/a | `number` | `1` | no |
| <a name="input_ltm_node_port"></a> [ltm\_node\_port](#input\_ltm\_node\_port) | Port of ltm node listening | `number` | `9092` | no |
| <a name="input_ltm_node_rate_limit"></a> [ltm\_node\_rate\_limit](#input\_ltm\_node\_rate\_limit) | n/a | `string` | `"disabled"` | no |
| <a name="input_ltm_node_ratio"></a> [ltm\_node\_ratio](#input\_ltm\_node\_ratio) | n/a | `number` | `1` | no |
| <a name="input_ltm_node_session"></a> [ltm\_node\_session](#input\_ltm\_node\_session) | n/a | `string` | `"user-enabled"` | no |
| <a name="input_ltm_nodes"></a> [ltm\_nodes](#input\_ltm\_nodes) | list of kafka broker node IPs | `list(any)` | n/a | yes |
| <a name="input_minimum_active_members"></a> [minimum\_active\_members](#input\_minimum\_active\_members) | Specifies whether the system load balances traffic according to the priority number assigned to the pool member,Default Value is 0 meaning disabled | `number` | `2` | no |
| <a name="input_monitors"></a> [monitors](#input\_monitors) | List of monitor names to associate with the pool | `list(any)` | <pre>[<br>  "/Common/tcp_half_open"<br>]</pre> | no |
| <a name="input_partition"></a> [partition](#input\_partition) | ## common variables | `string` | `"/Common"` | no |
| <a name="input_pool_description"></a> [pool\_description](#input\_pool\_description) | Specifies descriptive text that identifies the pool | `string` | `""` | no |
| <a name="input_reselect_tries"></a> [reselect\_tries](#input\_reselect\_tries) | Specifies the number of times the system tries to contact a new pool member after a passive failure | `number` | `0` | no |
| <a name="input_service_down_action"></a> [service\_down\_action](#input\_service\_down\_action) | Specifies how the system should respond when the target pool member becomes unavailable. The default is None, Possible: [none, reset, reselect, drop] | `string` | `"none"` | no |
| <a name="input_slow_ramp_time"></a> [slow\_ramp\_time](#input\_slow\_ramp\_time) | Specifies the duration during which the system sends less traffic to a newly-enabled pool member | `number` | `10` | no |
| <a name="input_virtual_server_destination"></a> [virtual\_server\_destination](#input\_virtual\_server\_destination) | IP of Virtual Server | `string` | n/a | yes |
| <a name="input_virtual_server_ip_protocol"></a> [virtual\_server\_ip\_protocol](#input\_virtual\_server\_ip\_protocol) | n/a | `string` | `"tcp"` | no |
| <a name="input_virtual_server_mask"></a> [virtual\_server\_mask](#input\_virtual\_server\_mask) | n/a | `string` | `"255.255.255.255"` | no |
| <a name="input_virtual_server_port"></a> [virtual\_server\_port](#input\_virtual\_server\_port) | n/a | `number` | `9092` | no |
| <a name="input_virtual_server_source_address_translation"></a> [virtual\_server\_source\_address\_translation](#input\_virtual\_server\_source\_address\_translation) | n/a | `string` | `"automap"` | no |
| <a name="input_virtual_server_state"></a> [virtual\_server\_state](#input\_virtual\_server\_state) | n/a | `string` | `"enabled"` | no |
| <a name="input_virtual_server_translate_address"></a> [virtual\_server\_translate\_address](#input\_virtual\_server\_translate\_address) | Turn address translation off for a virtual server if you want to use the virtual server to load balance connections to any address. This option is useful when the system is load balancing devices that have the same IP address | `string` | `"enabled"` | no |
| <a name="input_virtual_server_translate_port"></a> [virtual\_server\_translate\_port](#input\_virtual\_server\_translate\_port) | Enables or disables port translation. Turn port translation off for a virtual server if you want to use the virtual server to load balance connections to any service | `string` | `"enabled"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->