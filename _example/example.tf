provider "google" {
  project     = var.gcp_project_id
  region      = var.gcp_region
  zone        = var.gcp_zone
}

module "vpc" {
  source = "git::https://github.com/clouddrove/terraform-gcp-vpc.git?ref"

  name                           = "vpc"
  environment                    = "test"
  label_order                    = ["environment", "name"]
  google_compute_network_enabled = true
}

module "subnetwork" {
  source = "../"

  name        = "dev"
  environment = var.environment
  label_order = var.label_order

  google_compute_subnetwork_enabled = true
  module_enabled                    = true
  network                           = module.vpc.vpc_id
  project_id                        = "clouddrove"
  private_ip_google_access          = true

}