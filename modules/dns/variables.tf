variable "provision_dns" {
  description = "Set to false to disable A record provisioning"
  type        = bool
  default     = true
}

variable "provision_dns_ptr" {
  description = "Set to true to enable PTR record provisioning"
  type        = bool
  default     = true
}

variable "dns_server" {
  description = "DNS Server to send updates to"
  type        = string
  default     = ""
}

variable "dns_zone_name" {
  description = "DNS Zone"
  type        = string
  default     = ""
}

variable "dns_record_name" {
  description = "DNS Record name"
  type        = string
}

variable "dns_record_ips" {
  description = "IPs for the DNS record to point to"
  type        = list(string)
}

variable "dns_record_ttl" {
  description = "TTL for the DNS record"
  type        = number
  default     = 300
}

variable "zone_class" {
  description = "Zone class (x1.x2.x3.x4), must be a number among 1, 2, 3 to identify the network zone size"
  type        = number
  default     = 2
  validation {
    condition = alltrue([
      var.zone_class > 0,
      var.zone_class <= 3
    ])
    error_message = "Please set a positive number among 1,2,3."
  }
}

