output "confidential_ledgers_id" {
  description = "Map of id values across all confidential_ledgers, keyed the same as var.confidential_ledgers"
  value       = { for k, v in azurerm_confidential_ledger.confidential_ledgers : k => v.id if v.id != null && length(v.id) > 0 }
}
output "confidential_ledgers_azuread_based_service_principal" {
  description = "Map of azuread_based_service_principal values across all confidential_ledgers, keyed the same as var.confidential_ledgers"
  value       = { for k, v in azurerm_confidential_ledger.confidential_ledgers : k => v.azuread_based_service_principal if v.azuread_based_service_principal != null && length(v.azuread_based_service_principal) > 0 }
}
output "confidential_ledgers_certificate_based_security_principal" {
  description = "Map of certificate_based_security_principal values across all confidential_ledgers, keyed the same as var.confidential_ledgers"
  value       = { for k, v in azurerm_confidential_ledger.confidential_ledgers : k => v.certificate_based_security_principal if v.certificate_based_security_principal != null && length(v.certificate_based_security_principal) > 0 }
}
output "confidential_ledgers_identity_service_endpoint" {
  description = "Map of identity_service_endpoint values across all confidential_ledgers, keyed the same as var.confidential_ledgers"
  value       = { for k, v in azurerm_confidential_ledger.confidential_ledgers : k => v.identity_service_endpoint if v.identity_service_endpoint != null && length(v.identity_service_endpoint) > 0 }
}
output "confidential_ledgers_ledger_endpoint" {
  description = "Map of ledger_endpoint values across all confidential_ledgers, keyed the same as var.confidential_ledgers"
  value       = { for k, v in azurerm_confidential_ledger.confidential_ledgers : k => v.ledger_endpoint if v.ledger_endpoint != null && length(v.ledger_endpoint) > 0 }
}
output "confidential_ledgers_ledger_type" {
  description = "Map of ledger_type values across all confidential_ledgers, keyed the same as var.confidential_ledgers"
  value       = { for k, v in azurerm_confidential_ledger.confidential_ledgers : k => v.ledger_type if v.ledger_type != null && length(v.ledger_type) > 0 }
}
output "confidential_ledgers_location" {
  description = "Map of location values across all confidential_ledgers, keyed the same as var.confidential_ledgers"
  value       = { for k, v in azurerm_confidential_ledger.confidential_ledgers : k => v.location if v.location != null && length(v.location) > 0 }
}
output "confidential_ledgers_name" {
  description = "Map of name values across all confidential_ledgers, keyed the same as var.confidential_ledgers"
  value       = { for k, v in azurerm_confidential_ledger.confidential_ledgers : k => v.name if v.name != null && length(v.name) > 0 }
}
output "confidential_ledgers_resource_group_name" {
  description = "Map of resource_group_name values across all confidential_ledgers, keyed the same as var.confidential_ledgers"
  value       = { for k, v in azurerm_confidential_ledger.confidential_ledgers : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "confidential_ledgers_tags" {
  description = "Map of tags values across all confidential_ledgers, keyed the same as var.confidential_ledgers"
  value       = { for k, v in azurerm_confidential_ledger.confidential_ledgers : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

