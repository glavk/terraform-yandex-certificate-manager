resource "yandex_cm_certificate" "self_managed" {
  for_each = { for k, v in var.self_managed : k => v if length(var.self_managed) > 0 }

  folder_id = try(each.value.folder_id, null)

  name        = each.key
  description = each.value.description

  self_managed {
    certificate = each.value.certificate
    private_key = each.value.private_key

    private_key_lockbox_secret {
      id  = each.value.private_key_lockbox_secret.id
      key = each.value.private_key_lockbox_secret.key
    }
  }

  labels = each.value.labels
}

resource "yandex_cm_certificate" "managed" {
  for_each = { for k, v in var.managed : k => v if length(var.managed) > 0 }

  folder_id = try(each.value.folder_id, null)

  name        = each.key
  domains     = each.value.domains
  description = each.value.description

  managed {
    challenge_type  = each.value.challenge_type
    challenge_count = each.value.challenge_count
  }

  labels = each.value.labels
}