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
    certificate_based_security_principal = optional(object({
      ledger_role_name = string
      pem_public_key   = string
    }))
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
        v.certificate_based_security_principal == null || (length(v.certificate_based_security_principal.pem_public_key) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_confidential_ledger's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) <= 32
  #   message:   [from validate.ConfidentialLedgerName: invalid when len(value) > 32]
  #   source:    [from validate.ConfidentialLedgerName: invalid when len(value) > 32]
  # path: name
  #   condition: !startswith(value, "-")
  #   message:   [from validate.ConfidentialLedgerName: must not start with "-"]
  #   source:    [from validate.ConfidentialLedgerName: must not start with "-"]
  # path: name
  #   condition: !endswith(value, "-")
  #   message:   [from validate.ConfidentialLedgerName: must not end with "-"]
  #   source:    [from validate.ConfidentialLedgerName: must not end with "-"]
  # path: name
  #   condition: length(value) != 0
  #   message:   [from validate.ConfidentialLedgerName: invalid when len(value) == 0]
  #   source:    [from validate.ConfidentialLedgerName: invalid when len(value) == 0]
  # path: name
  #   source:    [from validate.ConfidentialLedgerName] !matched
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: ledger_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: azuread_based_service_principal.ledger_role_name
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: azuread_based_service_principal.principal_id
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: azuread_based_service_principal.tenant_id
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: certificate_based_security_principal.ledger_role_name
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

