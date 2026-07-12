output "lbs_edge_zone" {
  description = "Map of edge_zone values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.edge_zone }
}
output "lbs_frontend_ip_configuration" {
  description = "Map of frontend_ip_configuration values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.frontend_ip_configuration }
}
output "lbs_location" {
  description = "Map of location values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.location }
}
output "lbs_name" {
  description = "Map of name values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.name }
}
output "lbs_private_ip_address" {
  description = "Map of private_ip_address values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.private_ip_address }
}
output "lbs_private_ip_addresses" {
  description = "Map of private_ip_addresses values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.private_ip_addresses }
}
output "lbs_public_ip_address_id" {
  description = "Map of public_ip_address_id values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.public_ip_address_id }
}
output "lbs_resource_group_name" {
  description = "Map of resource_group_name values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.resource_group_name }
}
output "lbs_sku" {
  description = "Map of sku values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.sku }
}
output "lbs_sku_tier" {
  description = "Map of sku_tier values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.sku_tier }
}
output "lbs_subnet_id" {
  description = "Map of subnet_id values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.subnet_id }
}
output "lbs_tags" {
  description = "Map of tags values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.tags }
}

