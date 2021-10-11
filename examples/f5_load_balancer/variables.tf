variable "bigip_partition" { default = "Common" }
variable "bigip_ssl_cert_name" {}
variable "bigip_ssl_chain_name" {}
variable "bigip_ssl_key_name" {}
variable "bigip_vip_ip" {}
variable "bigip_vlans" {}
variable "cluster_name" { default = "" }
variable "dns_zone_name" {}
variable "environment" {}
variable "hostname_fmt" { default = "%s-%s-%s%02d" }
variable "node_count" {}
variable "service_port" {}
variable "vapp_name" {}
variable "datacenter" {}
variable "vsphere_network_ips" {}
