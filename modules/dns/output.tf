output "dns-a-fqdn" {
  description = "FQDN of the DNS A Record"
  value       = var.provision_dns ? format("%s.%s", dns_a_record_set.dns-a[0].name, dns_a_record_set.dns-a[0].zone) : null
}

output "dns-ptr-path" {
  description = "Full path of the DNS PTR Record"
  value       = var.provision_dns_ptr ? format("%s.%s", dns_ptr_record.dns-ptr[0].name, dns_ptr_record.dns-ptr[0].zone) : null
}
