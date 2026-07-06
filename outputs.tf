output "confidential_ledgers" {
  description = "All confidential_ledger resources"
  value       = azurerm_confidential_ledger.confidential_ledgers
}
output "confidential_ledgers_azuread_based_service_principal" {
  description = "List of azuread_based_service_principal values across all confidential_ledgers"
  value       = [for k, v in azurerm_confidential_ledger.confidential_ledgers : v.azuread_based_service_principal]
}
output "confidential_ledgers_certificate_based_security_principal" {
  description = "List of certificate_based_security_principal values across all confidential_ledgers"
  value       = [for k, v in azurerm_confidential_ledger.confidential_ledgers : v.certificate_based_security_principal]
}
output "confidential_ledgers_identity_service_endpoint" {
  description = "List of identity_service_endpoint values across all confidential_ledgers"
  value       = [for k, v in azurerm_confidential_ledger.confidential_ledgers : v.identity_service_endpoint]
}
output "confidential_ledgers_ledger_endpoint" {
  description = "List of ledger_endpoint values across all confidential_ledgers"
  value       = [for k, v in azurerm_confidential_ledger.confidential_ledgers : v.ledger_endpoint]
}
output "confidential_ledgers_ledger_type" {
  description = "List of ledger_type values across all confidential_ledgers"
  value       = [for k, v in azurerm_confidential_ledger.confidential_ledgers : v.ledger_type]
}
output "confidential_ledgers_location" {
  description = "List of location values across all confidential_ledgers"
  value       = [for k, v in azurerm_confidential_ledger.confidential_ledgers : v.location]
}
output "confidential_ledgers_name" {
  description = "List of name values across all confidential_ledgers"
  value       = [for k, v in azurerm_confidential_ledger.confidential_ledgers : v.name]
}
output "confidential_ledgers_resource_group_name" {
  description = "List of resource_group_name values across all confidential_ledgers"
  value       = [for k, v in azurerm_confidential_ledger.confidential_ledgers : v.resource_group_name]
}
output "confidential_ledgers_tags" {
  description = "List of tags values across all confidential_ledgers"
  value       = [for k, v in azurerm_confidential_ledger.confidential_ledgers : v.tags]
}

