terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "leon4eg13ru-storage-bucket"
    region     = "ru-central1"
    key        = "state-storage/terraform.tfstate"
    access_key = "yJtwUIm3F3oE8e9HSoJY"
    secret_key = "K68MtUbP2Xsgp98mWX27CvYUNKIIH0Unj49YDjgJ"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
