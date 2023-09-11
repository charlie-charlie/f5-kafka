module "load_balancer" {
  source      = "../../modules/f5_kafka"
  f5_address  = var.f5_address
  f5_username = var.f5_username
  f5_password = var.f5_password

  app_name = var.app_name

  virtual_server_destination = var.virtual_server_destination

  ltm_nodes = var.kb_node_ips
}
