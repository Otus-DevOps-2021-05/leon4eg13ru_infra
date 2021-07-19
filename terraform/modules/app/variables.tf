variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable subnet_id {
description = "Subnets for modules"
}
variable instance_name {
  description = "Instance name"
  default     = "reddit-app"
}
variable instance_tag {
  description = "Instance tag"
  default     = "reddit-app"
}
