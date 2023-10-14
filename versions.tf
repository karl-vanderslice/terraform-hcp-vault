terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.69.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "hcp" {}
provider "random" {}
