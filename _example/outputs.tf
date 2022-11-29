output "id" {
  value       = module.subnet.*.id
  description = "The ID of the s3 bucket."
}