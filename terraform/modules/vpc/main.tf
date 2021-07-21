resource "yandex_vpc_network" "app-network" {
  name = "app-network"
}

resource "yandex_vpc_subnet" "app-subnet" {
  name           = var.subnet_name
  zone           = var.zone
  network_id     = var.network_id
  v4_cidr_blocks = var.v4_cidr_blocks
}
