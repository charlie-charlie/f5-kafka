locals {
  dns_zone_name = join(".", split(".", var.dns_zone_name), [""])
}

resource "dns_a_record_set" "dns-a" {
  count     = var.provision_dns ? 1 : 0
  zone      = local.dns_zone_name
  name      = var.dns_record_name
  addresses = var.dns_record_ips
  ttl       = var.dns_record_ttl
}


resource "time_sleep" "wait_for_a" {
  depends_on = [dns_a_record_set.dns-a]
  create_duration = "1s"
}


resource "dns_ptr_record" "dns-ptr" {
  count = var.provision_dns_ptr ? length(var.dns_record_ips) : 0  
  zone  = join(".", reverse([for i in range(0,var.zone_class) : element(split(".", var.dns_record_ips[count.index]), i) ] ), ["in-addr", "arpa", ""])
  name  = join(".", reverse([for i in range(var.zone_class,4) : element(split(".", var.dns_record_ips[count.index]), i) ] ))
  ptr   = format("%s.%s", var.dns_record_name, local.dns_zone_name)
  ttl   = var.dns_record_ttl
  depends_on = [time_sleep.wait_for_a, dns_a_record_set.dns-a]
}

resource "time_sleep" "wait_for_ptr" {
  depends_on = [dns_ptr_record.dns-ptr]
  create_duration = "1s"
}

