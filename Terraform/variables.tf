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