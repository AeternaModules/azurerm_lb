output "lbs_id" {
  description = "Map of id values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.id if v.id != null && length(v.id) > 0 }
}
output "lbs_edge_zone" {
  description = "Map of edge_zone values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.edge_zone if v.edge_zone != null && length(v.edge_zone) > 0 }
}
output "lbs_frontend_ip_configuration" {
  description = "Map of frontend_ip_configuration values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.frontend_ip_configuration if v.frontend_ip_configuration != null && length(v.frontend_ip_configuration) > 0 }
}
output "lbs_location" {
  description = "Map of location values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.location if v.location != null && length(v.location) > 0 }
}
output "lbs_name" {
  description = "Map of name values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.name if v.name != null && length(v.name) > 0 }
}
output "lbs_private_ip_address" {
  description = "Map of private_ip_address values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.private_ip_address if v.private_ip_address != null && length(v.private_ip_address) > 0 }
}
output "lbs_private_ip_addresses" {
  description = "Map of private_ip_addresses values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.private_ip_addresses if v.private_ip_addresses != null && length(v.private_ip_addresses) > 0 }
}
output "lbs_public_ip_address_id" {
  description = "Map of public_ip_address_id values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.public_ip_address_id if v.public_ip_address_id != null && length(v.public_ip_address_id) > 0 }
}
output "lbs_resource_group_name" {
  description = "Map of resource_group_name values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "lbs_sku" {
  description = "Map of sku values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.sku if v.sku != null && length(v.sku) > 0 }
}
output "lbs_sku_tier" {
  description = "Map of sku_tier values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.sku_tier if v.sku_tier != null && length(v.sku_tier) > 0 }
}
output "lbs_subnet_id" {
  description = "Map of subnet_id values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.subnet_id if v.subnet_id != null && length(v.subnet_id) > 0 }
}
output "lbs_tags" {
  description = "Map of tags values across all lbs, keyed the same as var.lbs"
  value       = { for k, v in azurerm_lb.lbs : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

