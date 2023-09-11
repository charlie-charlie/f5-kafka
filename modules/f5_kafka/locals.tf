locals {
  app_name           = join("_", [var.app_name, var.ltm_node_port])
  virtual_serve_name = join("/", [var.partition, local.app_name])
  pool_name          = join("/", [var.partition, local.app_name])
}
