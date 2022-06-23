module "resource_group" {
  source = "./module"

  resource_group_name = var.resource_group_name
  region              = var.region
}
