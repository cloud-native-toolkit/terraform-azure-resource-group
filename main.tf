
resource null_resource wait_for_sync {
  count = var.enabled ? 1 : 0

  provisioner "local-exec" {
    command = "echo 'Sync: ${var.sync != null ? var.sync : ""}'"
  }
}

resource azurerm_resource_group resource_group {
  count = var.provision && var.enabled ? 1 : 0
  depends_on = [null_resource.wait_for_sync]

  name     = var.resource_group_name
  location = var.region
}

data azurerm_resource_group resource_group {
  count = var.enabled ? 1 : 0
  depends_on = [azurerm_resource_group.resource_group]

  name = var.resource_group_name
}