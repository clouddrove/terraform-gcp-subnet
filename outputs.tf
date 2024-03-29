output "id" {
  description = "GCS bucket id."
  value       = join("", google_compute_subnetwork.subnetwork[*].id)
}

output "name" {
  description = "GCS bucket name."
  value       = join("", google_compute_subnetwork.subnetwork[*].name)
}
