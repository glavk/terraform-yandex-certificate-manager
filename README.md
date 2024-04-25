# Terraform module

Terraform module which creates [resource](https://cloud.resource) on [Yandex.Cloud](https://cloud.yandex.ru/).

## Examples

### Self-managed certificate

Import into Certificate Manager a self-managed certificate.

```hcl
module "self-managed-simple" {
  source = "github.com/glavk/terraform-yandex-certificate-manager"

  self_managed = {
    main = {
      description = "main domain certificate"
      certificate = file("cert.pem")
      private_key = file("key.pem")
    }
  }
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.84 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.84 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_cm_certificate.managed](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/cm_certificate) | resource |
| [yandex_cm_certificate.self_managed](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/cm_certificate) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_managed"></a> [create\_managed](#input\_create\_managed) | Determines whether a managed certificate is created | `bool` | `false` | no |
| <a name="input_create_self_managed"></a> [create\_self\_managed](#input\_create\_self\_managed) | Determines whether a self managed certificate is created | `bool` | `true` | no |
| <a name="input_managed"></a> [managed](#input\_managed) | Managed certificate specification. | <pre>object({<br>    domains         = optional(list(string), [])    # List of domains for this certificate<br>    description     = optional(string, "")          # Certificate description.<br>    labels          = optional(map(string), {})     # Labels to assign to this certificate.<br>    challenge_type  = optional(string, "DNS_CNAME") # Domain owner-check method. Possible values: DNS_CNAME, DNS_TXT, HTTP<br>    challenge_count = optional(number, 1)           # Expected number of challenge count needed to validate certificate.<br>    folder_id       = optional(string, null)        # Folder ID where certificate will be created. If value is omitted, the default provider folder is used.<br>  })</pre> | `{}` | no |
| <a name="input_self_managed"></a> [self\_managed](#input\_self\_managed) | Self-managed certificate specification. | <pre>map(object({<br>    description                = optional(string, "")                                  # Certificate description.<br>    labels                     = optional(map(string), {})                             # Labels to assign to this certificate.<br>    certificate                = optional(string, null)                                # Certificate with chain.<br>    private_key                = optional(string, null)                                # Private key of certificate.<br>    private_key_lockbox_secret = optional(object({ id = string, key = string }), null) # Lockbox secret specification for getting private key.<br>    folder_id                  = optional(string, null)                                # Folder ID where certificate will be created. If value is omitted, the default provider folder is used.<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_managed_certificate_ids"></a> [managed\_certificate\_ids](#output\_managed\_certificate\_ids) | The IDs of the managed certificates. |
| <a name="output_self_managed_certificate_ids"></a> [self\_managed\_certificate\_ids](#output\_self\_managed\_certificate\_ids) | The IDs of the self-managed certificates. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

