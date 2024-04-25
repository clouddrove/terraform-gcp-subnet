provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
}

module "vpc" {
  source  = "clouddrove/vpc/gcp"
  version = "1.0.0"

  name                           = "vpc"
  environment                    = "test-1"
  label_order                    = ["environment", "name"]
  google_compute_network_enabled = true
}


# module "subnet" {
#   source = "../../"

#   name        = "dev"
#   environment = var.environment
#   label_order = var.label_order
#   gcp_region  = "us-central1"

#   google_compute_subnetwork_enabled  = true
#   google_compute_firewall_enabled    = true
#   google_compute_router_nat_enabled  = true
#   ipv6_access_type                   = "EXTERNAL"
#   network                            = module.vpc.vpc_id
#   project_id                         = "clouddrove"
#   private_ip_google_access           = true
#   source_ranges                      = ["10.10.0.0/16"]
#   asn                                = 64514
#   nat_ip_allocate_option             = "MANUAL_ONLY"
#   source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
#   filter                             = "ERRORS_ONLY"
#   dest_range                         = "0.0.0.0/0"
#   next_hop_gateway                   = "default-internet-gateway"
#   priority                           = 1000
#   secondary_ip_ranges = [
#     {
#       "range_name" : "services",
#       "ip_cidr_range" : "10.1.0.0/16"
#     },

#     {
#       "range_name" : "pods",
#       "ip_cidr_range" : "10.3.0.0/16"
#     }
#   ]
#   allow = [
#     {
#       "protocol" : "tcp",
#       "ports" : ["1-65535"]
#     }
#   ]
# }

module "subnet" {
  source = "../../"

  name                               = "example"
  environment                        = "production"
  label_order                        = ["environment", "name"]
  project_id                         = "cloud-crew-testing"
  google_compute_router_nat_enabled  = true
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  next_hop_gateway                   = "default-internet-gateway"
  filter                             = "ERRORS_ONLY"
  network                            = module.vpc.vpc_id
  subnets = [
    {
      subnet_name           = "subnet1"
      subnet_region         = "us-west1"
      subnet_ip             = "10.1.0.0/24"
      ipv6_access_type      = "EXTERNAL"
      subnet_private_access = true
    },
    {
      subnet_name           = "subnet2"
      subnet_region         = "us-central1"
      subnet_ip             = "10.2.0.0/24"
      ipv6_access_type      = "INTERNAL"
      subnet_private_access = false
    }
  ]
  secondary_ranges = {
    subnet1 = [
      {
        range_name    = "secondary-range-1"
        ip_cidr_range = "192.168.1.0/24"
      }
    ]
  }
}
