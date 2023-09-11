terraform {
  required_providers {
    bigip = {
      source = "F5Networks/bigip"
    }
  }
}

provider "bigip" {
  address  = "bp2-ilb02-l001.otxlab.net"
  username = "terraform"
  password = "Opentext!"
}
