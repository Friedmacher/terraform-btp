/* 
 * Required Terraform provider for this module.
 */
terraform {
  required_providers {
    btp = {
      source  = "SAP/btp"
      version = "~> 1.20.0"
    }
  }
}

locals {
  subaccount_name      = "SA ${var.project_name} - ${var.stage}"
  subaccount_subdomain = lower(replace("at-${var.project_name}-${var.stage}", " ", "-"))
}

/*
 * Create the subaccount
 */
resource "btp_subaccount" "subaccount" {
  name      = local.subaccount_name
  subdomain = local.subaccount_subdomain
  region    = var.subaccount_region
  parent_id = var.parent_id
  labels = {
    "stage" = ["${var.stage}"]
  }
}
