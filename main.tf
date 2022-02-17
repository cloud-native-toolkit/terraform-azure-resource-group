resource azurerm_resource_group resource_group {
  count = var.provision && var.enabled ? 1 : 0

  name     = var.resource_group_name
  location = var.region
}

data azurerm_resource_group resource_group {
  count = var.enabled ? 1 : 0
  depends_on = [azurerm_resource_group.resource_group]

  name = var.resource_group_name
}
