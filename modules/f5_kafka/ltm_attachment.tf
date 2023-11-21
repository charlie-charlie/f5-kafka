resource "time_sleep" "wait_for_pool"
  depends_on = [bigip_ltm_pool.pool]

  create_duration = var.time_wait
}

resource "bigip_ltm_pool_attachment" "attachment" {
  for_each = { for index, ip in var.ltm_nodes : index => ip }
  pool     = bigip_ltm_pool.pool.name
  node     = join(":", [each.value, var.ltm_node_port])

  depends_on = [time_sleep.wait_for_pool]
}
