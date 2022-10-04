terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "skcc-devops-aws"

    workspaces {
      name = "iac-lecture-ansible-network"
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
