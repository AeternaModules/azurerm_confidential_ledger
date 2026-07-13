variable "confidential_ledgers" {
  description = <<EOT
Map of confidential_ledgers, attributes below
Required:
    - ledger_type
    - location
    - name
    - resource_group_name
    - azuread_based_service_principal (block):
        - ledger_role_name (required)
        - principal_id (required)
        - tenant_id (required)
Optional:
    - tags
    - certificate_based_security_principal (block):
        - ledger_role_name (required)
        - pem_public_key (required)
EOT

  type = map(object({
    ledger_type         = string
    location            = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
    azuread_based_service_principal = list(object({
      ledger_role_name = string
      principal_id     = string
      tenant_id        = string
    }))
    certificate_based_security_principal = optional(list(object({
      ledger_role_name = string
      pem_public_key   = string
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.confidential_ledgers : (
        length(v.azuread_based_service_principal) >= 1
      )
    ])
    error_message = "Each azuread_based_service_principal list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.confidential_ledgers : (
        length(v.name) <= 32
      )
    ])
    error_message = "[from validate.ConfidentialLedgerName: invalid when len(value) > 32]"
  }
  validation {
    condition = alltrue([
      for k, v in var.confidential_ledgers : (
        !startswith(v.name, "-")
      )
    ])
    error_message = "[from validate.ConfidentialLedgerName: must not start with \"-\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.confidential_ledgers : (
        !endswith(v.name, "-")
      )
    ])
    error_message = "[from validate.ConfidentialLedgerName: must not end with \"-\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.confidential_ledgers : (
        length(v.name) != 0
      )
    ])
    error_message = "[from validate.ConfidentialLedgerName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.confidential_ledgers : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.confidential_ledgers : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.confidential_ledgers : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.confidential_ledgers : (
        alltrue([for item in v.azuread_based_service_principal : (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", item.principal_id)))])
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.confidential_ledgers : (
        alltrue([for item in v.azuread_based_service_principal : (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", item.tenant_id)))])
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.confidential_ledgers : (
        v.certificate_based_security_principal == null || alltrue([for item in v.certificate_based_security_principal : (length(item.pem_public_key) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.confidential_ledgers : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 9 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

