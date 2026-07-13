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
  # --- Unconfirmed validation candidates, derived from azurerm_lb's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: edge_zone
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: sku
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: sku_tier
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: frontend_ip_configuration.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: frontend_ip_configuration.subnet_id
  #   source:    [from commonids.ValidateSubnetID] !ok
  # path: frontend_ip_configuration.subnet_id
  #   source:    [from commonids.ValidateSubnetID] err != nil
  # path: frontend_ip_configuration.private_ip_address
  #   source:    validation.Any(...) - no translation rule yet, add one
  # path: frontend_ip_configuration.private_ip_address_version
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: frontend_ip_configuration.public_ip_address_id
  #   source:    [from commonids.ValidatePublicIPAddressID] !ok
  # path: frontend_ip_configuration.public_ip_address_id
  #   source:    [from commonids.ValidatePublicIPAddressID] err != nil
  # path: frontend_ip_configuration.public_ip_prefix_id
  #   source:    [from publicipprefixes.ValidatePublicIPPrefixID] !ok
  # path: frontend_ip_configuration.public_ip_prefix_id
  #   source:    [from publicipprefixes.ValidatePublicIPPrefixID] err != nil
  # path: frontend_ip_configuration.private_ip_address_allocation
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: frontend_ip_configuration.gateway_load_balancer_frontend_ip_configuration_id
  #   source:    [from loadbalancers.ValidateFrontendIPConfigurationID] !ok
  # path: frontend_ip_configuration.gateway_load_balancer_frontend_ip_configuration_id
  #   source:    [from loadbalancers.ValidateFrontendIPConfigurationID] err != nil
  # path: frontend_ip_configuration.load_balancer_rules[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: frontend_ip_configuration.inbound_nat_rules[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: frontend_ip_configuration.outbound_rules[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: frontend_ip_configuration.zones[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

