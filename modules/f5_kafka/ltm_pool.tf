# terraform import bigip_ltm_pool.k8s_prod_import /Common/k8prod_Pool

resource "bigip_ltm_pool" "pool" {
  name        = local.pool_name
  description = var.pool_description

  monitors = var.monitors

  load_balancing_mode    = var.load_balancing_mode
  minimum_active_members = var.minimum_active_members
  reselect_tries         = var.reselect_tries
  service_down_action    = var.service_down_action
  slow_ramp_time         = var.slow_ramp_time
}

