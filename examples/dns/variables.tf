variable "dns_key_name" {
  description = "The name of the TSIG key used to sign the DNS update messages."
  type        = string
}

variable "dns_key_algorithm" {
  description = "The algorithm to use for HMAC"
  type        = string
  default     = "hmac-sha256"
}

variable "dns_server" {
  description = "DNS Server to send updates to for the environment"
  type        = string
}

variable "dns_domain" {
  description = "DNS domain/zone to create the dns record in"
  type        = string
}

variable "dns_key_secret" {
  description = "A Base64-encoded string containing the shared secret to be used for TSIG"
  type        = string
}

variable "hostname" {
  description = "Hostname for the DNS record"
  type        = string
}

variable "ip" {
  description = "IP for the DNS record"
  type        = list(string)
}
