<!-- This file was automatically generated by the `geine`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->

<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform gcp subnet
</h1>

<p align="center" style="font-size: 1.2rem;"> 
    Terraform module to create subnet resource on google.
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v1.1.7-green" alt="Terraform">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>
<a href="https://github.com/clouddrove/terraform-gcp-subnet/actions/workflows/tfsec.yml">
  <img src="https://github.com/clouddrove/terraform-gcp-subnet/actions/workflows/tfsec.yml/badge.svg" alt="tfsec">
</a>
<a href="https://github.com/clouddrove/terraform-gcp-subnet/actions/workflows/terraform.yml">
  <img src="https://github.com/clouddrove/terraform-gcp-subnet/actions/workflows/terraform.yml/badge.svg" alt="static-checks">
</a>


</p>
<p align="center">

<a href='https://facebook.com/sharer/sharer.php?u=https://github.com/clouddrove/terraform-gcp-subnet'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/shareArticle?mini=true&title=Terraform+gcp+subnet&url=https://github.com/clouddrove/terraform-gcp-subnet'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>
<a href='https://twitter.com/intent/tweet/?text=Terraform+gcp+subnet&url=https://github.com/clouddrove/terraform-gcp-subnet'>
  <img title="Share on Twitter" src="https://user-images.githubusercontent.com/50652676/62817740-4c69db00-bb59-11e9-8a79-3580fbbf6d5c.png" />
</a>

</p>
<hr>


We eat, drink, sleep and most importantly love **DevOps**. We are working towards strategies for standardizing architecture while ensuring security for the infrastructure. We are strong believer of the philosophy <b>Bigger problems are always solved by breaking them into smaller manageable problems</b>. Resonating with microservices architecture, it is considered best-practice to run database, cluster, storage in smaller <b>connected yet manageable pieces</b> within the infrastructure. 

This module is basically combination of [Terraform open source](https://www.terraform.io/) and includes automatation tests and examples. It also helps to create and improve your infrastructure with minimalistic code instead of maintaining the whole infrastructure code yourself.

We have [*fifty plus terraform modules*][terraform_modules]. A few of them are comepleted and are available for open source usage while a few others are in progress.




## Prerequisites

This module has a few dependencies: 






## Examples


**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/clouddrove/terraform-gcp-subnet/releases).


Here are some examples of how you can use this module in your inventory structure:
### Default subnet
```hcl
module "subnet" {
  source = "clouddrove/subnet/google"

  name        = "dev"
  environment = var.environment
  label_order = var.label_order
  gcp_region  = "us-central1"

  google_compute_subnetwork_enabled  = true
  google_compute_firewall_enabled    = true
  google_compute_router_nat_enabled  = true
  module_enabled                     = true
  ipv6_access_type                   = "EXTERNAL"
  network                            = module.vpc.vpc_id
  project_id                         = "clouddrove"
  private_ip_google_access           = true
  allow                              = [{ "protocol" : "tcp", "ports" : ["1-65535"] }]
  source_ranges                      = ["10.10.0.0/16"]
  asn                                = 64514
  nat_ip_allocate_option             = "MANUAL_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  filter                             = "ERRORS_ONLY"
  dest_range                         = "0.0.0.0/0"
  next_hop_gateway                   = "default-internet-gateway"
  priority                           = 1000
  secondary_ip_ranges = [
    {
      "range_name" : "services",
      "ip_cidr_range" : "10.1.0.0/16"
    },

    {
      "range_name" : "pods",
      "ip_cidr_range" : "10.3.0.0/16"
    }
  ]
}
```






## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allow | (Optional) The list of ALLOW rules specified by this firewall. Each rule specifies a protocol and port-range tuple that describes a permitted connection. | `list(any)` | `[]` | no |
| asn | Local BGP Autonomous System Number (ASN). Must be an RFC6996 private ASN, either 16-bit or 32-bit. | `number` | `64514` | no |
| dest\_range | The destination range of outgoing packets that this route applies to. Only IPv4 is supported. | `string` | `"0.0.0.0/0"` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| filter | Specifies the desired filtering of logs on this NAT. | `string` | `""` | no |
| gcp\_region | Google Cloud region | `string` | `"europe-west3"` | no |
| google\_compute\_address\_enabled | n/a | `bool` | `true` | no |
| google\_compute\_firewall\_enabled | n/a | `bool` | `true` | no |
| google\_compute\_route\_enabled | n/a | `bool` | `true` | no |
| google\_compute\_router\_nat\_enabled | n/a | `bool` | `true` | no |
| google\_compute\_subnetwork\_enabled | n/a | `bool` | `true` | no |
| ip\_cidr\_range | (Required) The range of internal addresses that are owned by this subnetwork. Provide this property when you create the subnetwork. For example, 10.0.0.0/8 or 192.168.0.0/16. Ranges must be unique and non-overlapping within a network. Only IPv4 is supported. | `string` | `"10.10.0.0/24"` | no |
| ipv6\_access\_type | The access type of IPv6 address this subnet holds. | `string` | `""` | no |
| label\_order | Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] . | `list(any)` | `[]` | no |
| log\_config | (Optional) Logging options for the subnetwork flow logs. Setting this value to 'null' will disable them. See https://www.terraform.io/docs/providers/google/r/compute_subnetwork.html for more information and examples. | `any` | `true` | no |
| module\_enabled | n/a | `bool` | `true` | no |
| module\_timeouts | (Optional) How long certain operations (per resource type) are allowed to take before being considered to have failed. | `any` | `{}` | no |
| name | n/a | `string` | `""` | no |
| nat\_ip\_allocate\_option | How external IPs should be allocated for this NAT. | `string` | `"MANUAL_ONLY"` | no |
| network | (Required) The VPC network the subnets belong to. Only networks that are in the distributed mode can have subnetworks. | `string` | `""` | no |
| next\_hop\_gateway | URL to a gateway that should handle matching packets. | `string` | `""` | no |
| priority | The priority of this route. | `number` | `1000` | no |
| private\_ip\_google\_access | (Optional) When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access. | `bool` | `true` | no |
| project\_id | (Optional) The ID of the project in which the resource belongs. If it is not set, the provider project is used. | `string` | `""` | no |
| secondary\_ip\_ranges | An array of configurations for secondary IP ranges for VM instances contained in this subnetwork. The primary IP of such VM must belong to the primary ipCidrRange of the subnetwork. The alias IPs may belong to either primary or secondary ranges. | `any` | `[]` | no |
| source\_ranges | (Optional) If source ranges are specified, the firewall will apply only to traffic that has source IP address in these ranges. | `any` | `[]` | no |
| source\_subnetwork\_ip\_ranges\_to\_nat | How NAT should be configured per Subnetwork. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | GCS bucket id. |
| name | GCS bucket name. |




## Testing
In this module testing is performed with [terratest](https://github.com/gruntwork-io/terratest) and it creates a small piece of infrastructure, matches the output like ARN, ID and Tags name etc and destroy infrastructure in your AWS account. This testing is written in GO, so you need a [GO environment](https://golang.org/doc/install) in your system. 

You need to run the following command in the testing folder:
```hcl
  go test -run Test
```



## Feedback 
If you come accross a bug or have any feedback, please log it in our [issue tracker](https://github.com/clouddrove/terraform-gcp-subnet/issues), or feel free to drop us an email at [hello@clouddrove.com](mailto:hello@clouddrove.com).

If you have found it worth your time, go ahead and give us a ★ on [our GitHub](https://github.com/clouddrove/terraform-gcp-subnet)!

## About us

At [CloudDrove][website], we offer expert guidance, implementation support and services to help organisations accelerate their journey to the cloud. Our services include docker and container orchestration, cloud migration and adoption, infrastructure automation, application modernisation and remediation, and performance engineering.

<p align="center">We are <b> The Cloud Experts!</b></p>
<hr />
<p align="center">We ❤️  <a href="https://github.com/clouddrove">Open Source</a> and you can check out <a href="https://github.com/clouddrove">our other modules</a> to get help with your new Cloud ideas.</p>

  [website]: https://clouddrove.com
  [github]: https://github.com/clouddrove
  [linkedin]: https://cpco.io/linkedin
  [twitter]: https://twitter.com/clouddrove/
  [email]: https://clouddrove.com/contact-us.html
  [terraform_modules]: https://github.com/clouddrove?utf8=%E2%9C%93&q=terraform-&type=&language=
