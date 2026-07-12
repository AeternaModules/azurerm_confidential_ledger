output "confidential_ledgers_id" {
  description = "Map of id values across all confidential_ledgers, keyed the same as var.confidential_ledgers"
  value       = { for k, v in azurerm_confidential_ledger.confidential_ledgers : k => v.id }
}
output "confidential_ledgers_azuread_based_service_principal" {
  description = "Map of azuread_based_service_principal values across all confidential_ledgers, keyed the same as var.confidential_ledgers"
  value       = { for k, v in azurerm_confidential_ledger.confidential_ledgers : k => v.azuread_based_service_principal }
}
output "confidential_ledgers_certificate_based_security_principal" {
  description = "Map of certificate_based_security_principal values across all confidential_ledgers, keyed the same as var.confidential_ledgers"
  value       = { for k, v in azurerm_confidential_ledger.confidential_ledgers : k => v.certificate_based_security_principal }
}
output "confidential_ledgers_identity_service_endpoint" {
  description = "Map of identity_service_endpoint values across all confidential_ledgers, keyed the same as var.confidential_ledgers"
  value       = { for k, v in azurerm_confidential_ledger.confidential_ledgers : k => v.identity_service_endpoint }
}
output "confidential_ledgers_ledger_endpoint" {
  description = "Map of ledger_endpoint values across all confidential_ledgers, keyed the same as var.confidential_ledgers"
  value       = { for k, v in azurerm_confidential_ledger.confidential_ledgers : k => v.ledger_endpoint }
}
output "confidential_ledgers_ledger_type" {
  description = "Map of ledger_type values across all confidential_ledgers, keyed the same as var.confidential_ledgers"
  value       = { for k, v in azurerm_confidential_ledger.confidential_ledgers : k => v.ledger_type }
}
output "confidential_ledgers_location" {
  description = "Map of location values across all confidential_ledgers, keyed the same as var.confidential_ledgers"
  value       = { for k, v in azurerm_confidential_ledger.confidential_ledgers : k => v.location }
}
output "confidential_ledgers_name" {
  description = "Map of name values across all confidential_ledgers, keyed the same as var.confidential_ledgers"
  value       = { for k, v in azurerm_confidential_ledger.confidential_ledgers : k => v.name }
}
output "confidential_ledgers_resource_group_name" {
  description = "Map of resource_group_name values across all confidential_ledgers, keyed the same as var.confidential_ledgers"
  value       = { for k, v in azurerm_confidential_ledger.confidential_ledgers : k => v.resource_group_name }
}
output "confidential_ledgers_tags" {
  description = "Map of tags values across all confidential_ledgers, keyed the same as var.confidential_ledgers"
  value       = { for k, v in azurerm_confidential_ledger.confidential_ledgers : k => v.tags }
}

