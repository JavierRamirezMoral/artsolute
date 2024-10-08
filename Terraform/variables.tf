variable "resource_group_name" {
    description = "The name of the resource group"
    type        = string
}

variable "location" {
    description = "The location/region where the resources will be created"
    type        = string
}

variable "vnet_name" {
    description = "The name of the virtual network"
    type        = string
}

variable "vnet_address_space" {
    description = "The address space for the virtual network"
    type        = string
}

variable "internal_subnet_name" {
    description = "The name of the internal subnet"
    type        = string
}

variable "internal_subnet_prefix" {
    description = "The address prefix for the internal subnet"
    type        = string
}

variable "nsg_name" {
    description = "The name of the network security group"
    type        = string
}

variable "public_ip_name" {
    description = "The name of the public IP"
    type        = string
}

variable "appgw_name" {
    description = "The name of the application gateway"
    type        = string
}

variable "app_service_plan_name" {
    description = "The name of the app service plan"
    type        = string
}

variable "app_service_name" {
    description = "The name of the app service"
    type        = string
}

variable "firewall_name" {
    description = "The name of the firewall"
    type        = string
}

variable "internal_lb1_name" {
    description = "The name of the first internal load balancer"
    type        = string
}

variable "internal_lb2_name" {
    description = "The name of the second internal load balancer"
    type        = string
}
variable "frontend_subnet_name" {
    description = "The name of the frontend subnet"
    type        = string
}

variable "frontend_subnet_prefix" {
    description = "The address prefix for the frontend subnet"
    type        = string
}

variable "appgw_sku_name" {
    description = "The SKU name for the application gateway"
    type        = string
}

variable "appgw_sku_tier" {
    description = "The SKU tier for the application gateway"
    type        = string
}

variable "appgw_capacity" {
    description = "The capacity for the application gateway"
    type        = number
}

variable "appgw_frontend_port" {
    description = "The frontend port for the application gateway"
    type        = number
}

variable "appgw_backend_port" {
    description = "The backend port for the application gateway"
    type        = number
}

variable "appgw_request_timeout" {
    description = "The request timeout for the application gateway"
    type        = number
}

variable "appgw_waf_enabled" {
    description = "Enable or disable WAF for the application gateway"
    type        = bool
}

variable "appgw_waf_mode" {
    description = "The WAF mode for the application gateway"
    type        = string
}

variable "appgw_waf_rule_set_type" {
    description = "The WAF rule set type for the application gateway"
    type        = string
}

variable "appgw_waf_rule_set_version" {
    description = "The WAF rule set version for the application gateway"
    type        = string
}

variable "app_service_plan_sku_tier" {
    description = "The SKU tier for the app service plan"
    type        = string
}

variable "app_service_plan_sku_size" {
    description = "The SKU size for the app service plan"
    type        = string
}

variable "app_command_line" {
    description = "The command line for the app service"
    type        = string
}

variable "website_run_from_package" {
    description = "The setting for running the website from a package"
    type        = string
}

variable "waf_policy_custom_rule_name" {
    description = "The name of the custom rule for the WAF policy"
    type        = string
}

variable "waf_policy_custom_rule_priority" {
    description = "The priority of the custom rule for the WAF policy"
    type        = number
}

variable "waf_policy_custom_rule_match_variable" {
    description = "The match variable for the custom rule in the WAF policy"
    type        = string
}

variable "waf_policy_custom_rule_operator" {
    description = "The operator for the custom rule in the WAF policy"
    type        = string
}

variable "waf_policy_custom_rule_match_values" {
    description = "The match values for the custom rule in the WAF policy"
    type        = list(string)
}

variable "waf_policy_custom_rule_action" {
    description = "The action for the custom rule in the WAF policy"
    type        = string
}

variable "waf_policy_managed_rule_set_type" {
    description = "The managed rule set type for the WAF policy"
    type        = string
}

variable "waf_policy_managed_rule_set_version" {
    description = "The managed rule set version for the WAF policy"
    type        = string
}