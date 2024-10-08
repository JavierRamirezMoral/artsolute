

resource "azurerm_resource_group" "example" {
    name     = "example-resources"
    location = "West Europe"
}

resource "azurerm_virtual_network" "example" {
    name                = "example-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "internal" {
    name                 = "internal"
    resource_group_name  = azurerm_resource_group.example.name
    virtual_network_name = azurerm_virtual_network.example.name
    address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "frontend" {
    name                 = "frontend"
    resource_group_name  = azurerm_resource_group.example.name
    virtual_network_name = azurerm_virtual_network.example.name
    address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "example" {
    name                = "example-nsg"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name

    security_rule {
        name                       = "AllowHTTP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "AllowHTTPS"
        priority                   = 101
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}

resource "azurerm_subnet_network_security_group_association" "example" {
    subnet_id                 = azurerm_subnet.frontend.id
    network_security_group_id = azurerm_network_security_group.example.id
}

resource "azurerm_public_ip" "example" {
    name                = "example-pip"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    allocation_method   = "Static"
    sku                 = "Standard"
}

resource "azurerm_application_gateway" "example" {
    name                = "example-appgw"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    sku {
        name     = "WAF_v2"
        tier     = "WAF_v2"
        capacity = 2
    }

    gateway_ip_configuration {
        name      = "appgw-ip-config"
        subnet_id = azurerm_subnet.frontend.id
    }

    frontend_port {
        name = "frontendPort"
        port = 80
    }

    frontend_ip_configuration {
        name                 = "appgw-frontend-ip"
        public_ip_address_id = azurerm_public_ip.example.id
    }

    backend_address_pool {
        name = "appgw-backend-pool"
    }

    backend_http_settings {
        name                  = "appgw-http-settings"
        cookie_based_affinity = "Disabled"
        port                  = 80
        protocol              = "Http"
        request_timeout       = 20
    }

    http_listener {
        name                           = "appgw-listener"
        frontend_ip_configuration_name = "appgw-frontend-ip"
        frontend_port_name             = "frontendPort"
        protocol                       = "Http"
    }

    request_routing_rule {
        name                       = "appgw-routing-rule"
        rule_type                  = "Basic"
        http_listener_name         = "appgw-listener"
        backend_address_pool_name  = "appgw-backend-pool"
        backend_http_settings_name = "appgw-http-settings"
    }

    waf_configuration {
        enabled            = true
        firewall_mode      = "Prevention"
        rule_set_type      = "OWASP"
        rule_set_version   = "3.2"
    }
}

resource "azurerm_app_service_plan" "example" {
    name                = "example-appserviceplan"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    sku {
        tier     = "Standard"
        size     = "S1"
    }
}

resource "azurerm_app_service" "example" {
    name                = "example-appservice"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    app_service_plan_id = azurerm_app_service_plan.example.id
    site_config {
        app_command_line = "dotnet example.dll"
    }
    app_settings = {
        "WEBSITE_RUN_FROM_PACKAGE" = "1"
    }
}

resource "azurerm_web_application_firewall_policy" "example" {
    name                = "example-waf-policy"
    resource_group_name = azurerm_resource_group.example.name
    location            = azurerm_resource_group.example.location

    custom_rules {
        name      = "ExampleCustomRule"
        priority  = 1
        rule_type = "MatchRule"

        match_conditions {
            match_variables {
                variable_name = "RemoteAddr"
            }
            operator           = "IPMatch"
            negation_condition = false
            match_values       = ["192.168.1.0/24"]
        }

        action = "Block"
    }

    managed_rules {
        managed_rule_set {
            type    = "OWASP"
            version = "3.2"
        }
    }
}