variable "folder_name" {
  description = "Folder that the resource belongs to. If value is omitted, the default provider folder is used."
  type        = string
  default     = null
}

variable "self_managed" {
  description = "Self-managed certificate specification."
  type = map(object({
    description                = optional(string, "")                                  # Certificate description.
    labels                     = optional(map(string), {})                             # Labels to assign to this certificate.
    certificate                = string                                                # Certificate with chain.
    private_key                = string                                                # Private key of certificate.
    private_key_lockbox_secret = optional(object({ id = string, key = string }), null) # Lockbox secret specification for getting private key.
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
    challenge_type  = string                     # Domain owner-check method. Possible values: DNS_CNAME, DNS_TXT, HTTP
    challenge_count = optional(number, 1)        # Expected number of challenge count needed to validate certificate.
  })
  default = {
    challenge_type = "DNS_CNAME"
  }
}
