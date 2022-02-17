module "resource_group" {
  source = "./module"

  resource_group_name = var.resource_group_name
  region              = var.region
  enabled             = var.enabled
}

resource null_resource print_enabled {
  provisioner "local-exec" {
    command = "echo -n '${module.resource_group.enabled}' > .enabled"
  }
}
