module "dns_example" {
  source            = "../../modules/dns"
  dns_record_ips    = var.ip
  dns_record_name   = var.hostname
  dns_record_ttl    = 300
  dns_server        = var.dns_server
  dns_zone_name     = var.dns_domain
  provision_dns     = true
  provision_dns_ptr = true
  zone_class        = 2
}
