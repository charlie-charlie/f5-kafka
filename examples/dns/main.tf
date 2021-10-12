module "dns_example" {
  source = "../../../modules/dns/vsphere"

  provision_dns     = true
  provision_dns_ptr = true
  dns_server        = var.dns_server
  dns_zone_name     = var.dns_domain
  dns_record_name   = var.hostname
  dns_record_ips    = var.ip
  zone_class        = 2
  dns_record_ttl    = 300
}
