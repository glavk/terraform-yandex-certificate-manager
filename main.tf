resource "yandex_cm_certificate" "self_managed" {
  for_each = var.self_managed

  folder_id = each.value.folder_id

  name        = each.key
  description = each.value.description

  self_managed {
    certificate = each.value.certificate
    private_key = each.value.private_key

    private_key_lockbox_secret = each.value.private_key_lockbox_secret
  }

  labels = each.value.labels
}

resource "yandex_cm_certificate" "managed" {
  for_each = var.managed

  folder_id = each.value.folder_id

  name        = each.key
  domains     = each.value.domains
  description = each.value.description

  managed {
    challenge_type  = each.value.challenge_type
    challenge_count = each.value.challenge_count
  }

  labels = each.value.labels
}