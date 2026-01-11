resource "azurerm_confidential_ledger" "confidential_ledgers" {
  for_each = var.confidential_ledgers

  ledger_type         = each.value.ledger_type
  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags

  azuread_based_service_principal {
    ledger_role_name = each.value.azuread_based_service_principal.ledger_role_name
    principal_id     = each.value.azuread_based_service_principal.principal_id
    tenant_id        = each.value.azuread_based_service_principal.tenant_id
  }

  dynamic "certificate_based_security_principal" {
    for_each = each.value.certificate_based_security_principal != null ? [each.value.certificate_based_security_principal] : []
    content {
      ledger_role_name = certificate_based_security_principal.value.ledger_role_name
      pem_public_key   = certificate_based_security_principal.value.pem_public_key
    }
  }
}

