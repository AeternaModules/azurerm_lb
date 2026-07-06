output "lbs" {
  description = "All lb resources"
  value       = azurerm_lb.lbs
}
output "lbs_edge_zone" {
  description = "List of edge_zone values across all lbs"
  value       = [for k, v in azurerm_lb.lbs : v.edge_zone]
}
output "lbs_frontend_ip_configuration" {
  description = "List of frontend_ip_configuration values across all lbs"
  value       = [for k, v in azurerm_lb.lbs : v.frontend_ip_configuration]
}
output "lbs_location" {
  description = "List of location values across all lbs"
  value       = [for k, v in azurerm_lb.lbs : v.location]
}
output "lbs_name" {
  description = "List of name values across all lbs"
  value       = [for k, v in azurerm_lb.lbs : v.name]
}
output "lbs_private_ip_address" {
  description = "List of private_ip_address values across all lbs"
  value       = [for k, v in azurerm_lb.lbs : v.private_ip_address]
}
output "lbs_private_ip_addresses" {
  description = "List of private_ip_addresses values across all lbs"
  value       = [for k, v in azurerm_lb.lbs : v.private_ip_addresses]
}
output "lbs_public_ip_address_id" {
  description = "List of public_ip_address_id values across all lbs"
  value       = [for k, v in azurerm_lb.lbs : v.public_ip_address_id]
}
output "lbs_resource_group_name" {
  description = "List of resource_group_name values across all lbs"
  value       = [for k, v in azurerm_lb.lbs : v.resource_group_name]
}
output "lbs_sku" {
  description = "List of sku values across all lbs"
  value       = [for k, v in azurerm_lb.lbs : v.sku]
}
output "lbs_sku_tier" {
  description = "List of sku_tier values across all lbs"
  value       = [for k, v in azurerm_lb.lbs : v.sku_tier]
}
output "lbs_subnet_id" {
  description = "List of subnet_id values across all lbs"
  value       = [for k, v in azurerm_lb.lbs : v.subnet_id]
}
output "lbs_tags" {
  description = "List of tags values across all lbs"
  value       = [for k, v in azurerm_lb.lbs : v.tags]
}

