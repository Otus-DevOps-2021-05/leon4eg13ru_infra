variable "subnet_name" {
  description = "Sabnet name"
  default     = "app_subnet"
}
variable zone {
  description = "Zone"
  default     = "ru-central1-a"
}
variable "network_id" {
  description = "network id"
  default     = "${yandex_vpc_network.app-network.id}"
}
variable v4_cidr_blocks {
  description = "subnet Ip address pool"
  default     = "192.168.10.0/24"
}
