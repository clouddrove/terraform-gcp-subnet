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

module "subnet" {
  source = "../../"

  name                               = "example"
  environment                        = "production"
  label_order                        = ["environment", "name"]
  project_id                         = "clouddrove"
  google_compute_router_nat_enabled  = true
  google_compute_route_enabled       = true
  google_compute_address_enabled     = true
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
        range_name    = "services"
        ip_cidr_range = "192.168.1.0/24"
      },
    ]
  }
  log_config = {
    aggregation_interval = "INTERVAL_15_MIN"
    flow_sampling        = 0
    metadata             = "EXCLUDE_ALL_METADATA"
  }
}

