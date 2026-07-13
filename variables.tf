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
    sku                  = optional(string)
    sku_tier             = optional(string)
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
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.lbs : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.lbs : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.lbs : (
        v.edge_zone == null || (length(v.edge_zone) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.lbs : (
        v.frontend_ip_configuration == null || alltrue([for item in v.frontend_ip_configuration : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.lbs : (
        v.frontend_ip_configuration == null || alltrue([for item in v.frontend_ip_configuration : (alltrue([for x in item.load_balancer_rules : length(x) > 0]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.lbs : (
        v.frontend_ip_configuration == null || alltrue([for item in v.frontend_ip_configuration : (alltrue([for x in item.inbound_nat_rules : length(x) > 0]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.lbs : (
        v.frontend_ip_configuration == null || alltrue([for item in v.frontend_ip_configuration : (alltrue([for x in item.outbound_rules : length(x) > 0]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.lbs : (
        v.frontend_ip_configuration == null || alltrue([for item in v.frontend_ip_configuration : (item.zones == null || (alltrue([for x in item.zones : length(x) > 0])))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.lbs : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 18 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

