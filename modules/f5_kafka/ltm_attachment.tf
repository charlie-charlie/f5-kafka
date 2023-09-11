resource "bigip_ltm_pool_attachment" "attachment" {
  for_each = { for index, ip in var.ltm_nodes : index => ip }
  pool     = bigip_ltm_pool.pool.name
  node     = join(":", [each.value, var.ltm_node_port])
}
