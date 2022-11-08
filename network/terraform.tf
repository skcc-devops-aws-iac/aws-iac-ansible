terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "iac-lecture-ansible"

    workspaces {
      name = "iac-lecture-ansible-network-test01"
    }
  }
}


###################################################
# Local Variables
###################################################

locals {
  context = yamldecode(file(var.config_file)).context
  config  = yamldecode(templatefile(var.config_file, local.context))
}


###################################################
# Providers
###################################################

provider "aws" {
  region = "ap-northeast-2"
}
