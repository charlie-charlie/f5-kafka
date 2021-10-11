resource "bigip_ltm_virtual_server" "service_https" {
  count       = var.provision_lb ? 1 : 0
  name        = format("/%s/%s", var.bigip_partition, format("%s.%s_https", var.cluster_name, var.dns_zone_name))
  destination = var.bigip_vip_ip
  description = format("%s virtual server", var.cluster_name)
  port        = 9200
  pool        = bigip_ltm_pool.pool[0].name
  profiles    = [for n in ["tcp"] : format("/%s/%s", var.bigip_partition, n)]
  //client_profiles            = [for n in ["esaudit-ssl-profile"] : format("/%s/%s", var.bigip_partition, n)]
  server_profiles            = [format("/%s/serverssl", var.bigip_partition)]
  client_profiles            = [bigip_ltm_profile_client_ssl.client_ssl[0].name]
  vlans_enabled              = true
  vlans                      = formatlist("/%s/%s", var.bigip_partition, var.bigip_vlans)
  source_address_translation = "automap"
  translate_address          = "enabled"
  translate_port             = "enabled"
}

resource "bigip_ltm_node" "node" {
  count            = var.provision_lb ? var.node_count : 0
  name             = format("/%s/%s.%s", var.bigip_partition, format(var.hostname_fmt, var.datacenter, var.vapp_name, var.environment, count.index + 1), var.dns_zone_name)
  address          = var.vm_ips[count.index]
  connection_limit = "0"
  dynamic_ratio    = "1"
  monitor          = format("/%s/icmp", var.bigip_partition)
  description      = format(var.hostname_fmt, var.datacenter, var.vapp_name, var.environment, count.index + 1)
  rate_limit       = "disabled"
  fqdn {
    address_family = "ipv4"
    interval       = "30S00"
  }
}

resource "bigip_ltm_pool_attachment" "attachment" {
  count = var.provision_lb ? var.node_count : 0
  pool  = bigip_ltm_pool.pool[0].name
  node  = format("%s:%s", bigip_ltm_node.node[count.index].name, var.service_port)
}

resource "bigip_ltm_pool" "pool" {
  count                  = var.provision_lb ? 1 : 0
  name                   = format("/%s/%s.%s_%s", var.bigip_partition, var.cluster_name, var.dns_zone_name, var.service_port)
  load_balancing_mode    = "round-robin"
  minimum_active_members = 1
  monitors               = [bigip_ltm_monitor.https[0].name]
}
#
resource "bigip_ltm_monitor" "https" {
  count       = var.provision_lb ? 1 : 0
  name        = format("/%s/%s_%s", var.bigip_partition, var.cluster_name, "https")
  parent      = format("/%s/%s", var.bigip_partition, "https")
  send        = "GET / HTTP/1.1\r\nConnection: close\r\n\r\n"
  receive     = "HTTP/1.1 200 OK"
  timeout     = "15"
  interval    = "5"
  username    = var.service_monitor_username
  password    = var.service_monitor_password
  destination = format("*:%s", var.service_port)
}
#
resource "bigip_ltm_profile_client_ssl" "client_ssl" {
  count         = var.provision_lb ? 1 : 0
  name          = format("/%s/%s", var.bigip_partition, var.cluster_name)
  defaults_from = format("/%s/clientssl", var.bigip_partition)
  authenticate  = "always"
  ciphers       = var.bigip_ssl_ciphers

  cert  = (var.provision_lb_certs && var.bigip_ssl_cert_path != "") ? bigip_ssl_certificate.cert[0].name : format("/%s/%s", var.bigip_partition, var.bigip_ssl_cert_name)
  key   = (var.provision_lb_certs && var.bigip_ssl_key_path != "") ? bigip_ssl_key.key[0].name : format("/%s/%s", var.bigip_partition, var.bigip_ssl_key_name)
  chain = (var.provision_lb_certs && var.bigip_ssl_chain_path != "") ? bigip_ssl_certificate.chain[0].name : format("/%s/%s", var.bigip_partition, var.bigip_ssl_chain_name)
}

resource "bigip_ssl_certificate" "chain" {
  count     = (var.provision_lb_certs && var.bigip_ssl_chain_path != "") ? 1 : 0
  name      = format("%s-chain", var.cluster_name)
  content   = file(var.bigip_ssl_chain_path)
  partition = var.bigip_partition
}

resource "bigip_ssl_certificate" "cert" {
  count     = var.provision_lb_certs && var.bigip_ssl_cert_path != "" ? 1 : 0
  name      = format("%s-cert", var.cluster_name)
  content   = file(var.bigip_ssl_cert_path)
  partition = var.bigip_partition
}

resource "bigip_ssl_key" "key" {
  count     = var.provision_lb_certs && var.bigip_ssl_key_path != "" ? 1 : 0
  name      = format("%s-key", var.cluster_name)
  content   = file(var.bigip_ssl_key_path)
  partition = var.bigip_partition
}
