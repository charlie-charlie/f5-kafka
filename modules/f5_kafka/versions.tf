terraform {
  required_providers {
    bigip = {
      source  = "F5Networks/bigip"
      version = "1.19.0"
    }
  }
  required_version = ">= 0.13"
}

