output "id" {
  value       = module.subnet[*].subnet_ids
  description = "The ID of the subnets"
}