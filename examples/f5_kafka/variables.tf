variable "f5_address" {
  description = "Address of the F5"
  type        = string
}

variable "f5_username" {}

variable "f5_password" {}

variable "app_name" {
  description = "Name given to F5 resource like virtual server, in naming format <app>-<cluster#>-<project>-<env>  like kafka-1-toyota-dev)"
  type        = string
  default     = "kafka-88-mapr-dev"
}

variable "virtual_server_destination" {
  description = "IP for F5 virtual server"
  type        = string
}

variable "kb_node_ips" {
  description = "IP list of KB"
  type        = list(any)
}
