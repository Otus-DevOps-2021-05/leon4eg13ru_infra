variable "cloud_id" {
  description = "Cloud"
}
variable "folder_id" {
  description = "Folder"
}
variable "zone" {
  description = "Zone"
  default     = "ru-central1-a"
}
variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable "image_id" {
  description = "Disk image"
}
variable "subnet_id" {
  description = "Subnet"
}
variable "service_account_key_file" {
  description = "key .json"
}
variable "private_key_file" {
  description = "key.pem"
}
variable "access_key" {
  description = "access key id"
}
variable "secret_key" {
  description = "secret key for access"
}
variable "bucket_name" {
  description = "Name of created bucket"
}
