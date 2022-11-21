output "id" {
  value       = module.subnetwork.*.id
  description = "The ID of the s3 bucket."
}