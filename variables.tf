variable "self_managed" {
  description = "Self-managed certificate specification."
  type = map(object({
    description                = optional(string, "")                                  # Certificate description.
    labels                     = optional(map(string), {})                             # Labels to assign to this certificate.
    certificate                = string                                                # Certificate with chain.
    private_key                = string                                                # Private key of certificate.
    private_key_lockbox_secret = optional(object({ id = string, key = string }), null) # Lockbox secret specification for getting private key.
    folder_id                  = optional(string, null)                                # Folder ID where certificate will be created. If value is omitted, the default provider folder is used.
  }))
  default = {
    certificate = null
    private_key = null
  }
}

variable "managed" {
  description = "Managed certificate specification."
  type = object({
    domains         = optional(list(string), []) # List of domains for this certificate
    description     = optional(string, "")       # Certificate description.
    labels          = optional(map(string), {})  # Labels to assign to this certificate.
    challenge_type  = string                     # Domain owner-check method. Possible values: DNS_CNAME, DNS_TXT, HTTP
    challenge_count = optional(number, 1)        # Expected number of challenge count needed to validate certificate.
    folder_id       = optional(string, null)     # Folder ID where certificate will be created. If value is omitted, the default provider folder is used.
  })
  default = {
    challenge_type = "DNS_CNAME"
  }
}
