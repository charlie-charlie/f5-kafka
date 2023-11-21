### variables for provider.tf
variable "f5_address" {}
variable "f5_username" {}
variable "f5_password" {}

### common variables
variable "partition" {
  default = "/Common"
}

variable "app_name" {
  description = "Name of application. <app>-<cluster#>-<project>-<env>  like kafka-1-toyota-dev etc"
  type        = string
}

variable "time_wait" {
  description = "Seconds to wait for resource"
  type        = number
  default     = 2
}

### variables for pool
variable "pool_description" {
  description = "Specifies descriptive text that identifies the pool"
  type        = string
  default     = ""
}

variable "monitors" {
  description = "List of monitor names to associate with the pool"
  type        = list(any)
  default     = ["/Common/tcp_half_open"]
}

variable "load_balancing_mode" {
  description = "Specifies the load balancing method. The default is Round Robin"
  type        = string
  default     = "round-robin"
}

variable "minimum_active_members" {
  description = "Specifies whether the system load balances traffic according to the priority number assigned to the pool member,Default Value is 0 meaning disabled"
  type        = number
  default     = 2
}

variable "slow_ramp_time" {
  description = "Specifies the duration during which the system sends less traffic to a newly-enabled pool member"
  type        = number
  default     = 10
}

variable "service_down_action" {
  description = "Specifies how the system should respond when the target pool member becomes unavailable. The default is None, Possible: [none, reset, reselect, drop]"
  type        = string
  default     = "none"
}

variable "reselect_tries" {
  description = "Specifies the number of times the system tries to contact a new pool member after a passive failure"
  type        = number
  default     = 0
}

### variables for virtual server
variable "virtual_server_destination" {
  description = "IP of Virtual Server"
  type        = string
}

variable "virtual_server_mask" { default = "255.255.255.255" }

variable "virtual_server_ip_protocol" { default = "tcp" }

variable "virtual_server_port" { default = 9092 }

variable "virtual_server_source_address_translation" { default = "automap" }

variable "virtual_server_translate_address" {
  description = "Turn address translation off for a virtual server if you want to use the virtual server to load balance connections to any address. This option is useful when the system is load balancing devices that have the same IP address"
  type        = string
  default     = "enabled"
}

variable "virtual_server_state" { default = "enabled" }

variable "virtual_server_translate_port" {
  description = "Enables or disables port translation. Turn port translation off for a virtual server if you want to use the virtual server to load balance connections to any service"
  type        = string
  default     = "enabled"
}

### variables fro ltm node
variable "ltm_nodes" {
  description = "list of kafka broker node IPs"
  type        = list(any)
}

variable "ltm_node_port" {
  description = "Port of ltm node listening"
  type        = number
  default     = 9092
}

variable "sleep_wait" {
  description = "Seconds to wait"
  type        = number
  default     = 10
}
