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
| log\_config | VPC flow logging options for this subnetwork | `map(any)` | `null` | no |
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

