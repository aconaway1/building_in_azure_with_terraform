# SHARED Vnet
resource "azurerm_virtual_network" "SHARED" {
    name = "VNET1"
    location = azurerm_resource_group.RG01.location
    resource_group_name = azurerm_resource_group.RG01.name
    address_space = [ "10.0.252.0/22" ]
}

resource "azurerm_subnet" "MGMT" {
    name = "MGMT"
    resource_group_name = azurerm_resource_group.RG01.name
    virtual_network_name = azurerm_virtual_network.SHARED.name
    address_prefixes = [ "10.0.252.0/24" ]
}

resource "azurerm_subnet" "DOMAIN" {
    name = "DOMAIN"
    resource_group_name = azurerm_resource_group.RG01.name
    virtual_network_name = azurerm_virtual_network.SHARED.name
    address_prefixes = [ "10.0.253.0/24" ]
}

# SERVERS Vnet
resource "azurerm_virtual_network" "SERVERS" {
    name = "SERVERS"
    location = azurerm_resource_group.RG01.location
    resource_group_name = azurerm_resource_group.RG01.name
    address_space = [ "10.100.0.0/22" ]
}

resource "azurerm_subnet" "FE" {
    name = "FE"
    resource_group_name = azurerm_resource_group.RG01.name
    virtual_network_name = azurerm_virtual_network.SERVERS.name
    address_prefixes = [ "10.100.0.0/24" ]
}

resource "azurerm_subnet" "BE" {
    name = "BE"
    resource_group_name = azurerm_resource_group.RG01.name
    virtual_network_name = azurerm_virtual_network.SHARED.name
    address_prefixes = [ "10.100.1.0/24" ]
}


