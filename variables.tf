variable "lbs" {
  description = <<EOT
Map of lbs, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - edge_zone
    - public_ip_address_id
    - sku
    - sku_tier
    - subnet_id
    - tags
    - frontend_ip_configuration (block):
        - gateway_load_balancer_frontend_ip_configuration_id (optional)
        - name (required)
        - private_ip_address (optional)
        - private_ip_address_allocation (optional)
        - private_ip_address_version (optional)
        - public_ip_address_id (optional)
        - public_ip_prefix_id (optional)
        - subnet_id (optional)
        - zones (optional)
EOT

  type = map(object({
    location             = string
    name                 = string
    resource_group_name  = string
    edge_zone            = optional(string)
    public_ip_address_id = optional(string)
    sku                  = optional(string) # Default: "Standard"
    sku_tier             = optional(string) # Default: "Regional"
    subnet_id            = optional(string)
    tags                 = optional(map(string))
    frontend_ip_configuration = optional(list(object({
      gateway_load_balancer_frontend_ip_configuration_id = optional(string)
      name                                               = string
      private_ip_address                                 = optional(string)
      private_ip_address_allocation                      = optional(string)
      private_ip_address_version                         = optional(string)
      public_ip_address_id                               = optional(string)
      public_ip_prefix_id                                = optional(string)
      subnet_id                                          = optional(string)
      zones                                              = optional(set(string))
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.lbs : (
        v.frontend_ip_configuration == null || (length(v.frontend_ip_configuration) >= 1)
      )
    ])
    error_message = "Each frontend_ip_configuration list must contain at least 1 items"
  }
}

