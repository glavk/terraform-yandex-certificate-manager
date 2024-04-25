output "managed_certificate_ids" {
  description = "The IDs of the managed certificates."
  value       = try(yandex_cm_certificate.managed[*].id, null)
}

output "self_managed_certificate_ids" {
  description = "The IDs of the self-managed certificates."
  value       = try(yandex_cm_certificate.self_managed[*].id, null)
}