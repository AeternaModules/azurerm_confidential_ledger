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
    azuread_based_service_principal = object({
      ledger_role_name = string
      principal_id     = string
      tenant_id        = string
    })
    certificate_based_security_principal = optional(object({
      ledger_role_name = string
      pem_public_key   = string
    }))
  }))
}

