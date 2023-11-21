resource "time_sleep" "wait_for_attachment" {
  depends_on = [bigip_ltm_pool_attachment.attachment]

  create_duration = var.time_wait
}

# terraform import bigip_ltm_virtual_server.http /Common/terraform_vs_http
resource "bigip_ltm_virtual_server" "tcp" {
  name                       = local.virtual_serve_name
  description                = var.app_name
  destination                = var.virtual_server_destination
  mask                       = var.virtual_server_mask
  port                       = var.virtual_server_port
  pool                       = bigip_ltm_pool.pool.name
  ip_protocol                = var.virtual_server_ip_protocol
  irules                     = []
  persistence_profiles       = ["/Common/hash", ]
  policies                   = []
  profiles                   = ["/Common/tcp", ]
  security_log_profiles      = []
  source                     = "0.0.0.0/0"
  source_address_translation = var.virtual_server_source_address_translation
  state                      = var.virtual_server_state
  translate_address          = var.virtual_server_translate_address
  translate_port             = var.virtual_server_translate_port
  vlans                      = []
  vlans_enabled              = false

  depends_on = [time_sleep.wait_for_attachment]
}
