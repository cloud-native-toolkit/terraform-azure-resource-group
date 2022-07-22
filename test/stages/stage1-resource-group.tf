resource "random_string" "cluster_id" {
    length = 5
    special = false
    upper = false
}

module "resource_group" {
  source = "./module"

  resource_group_name = "${var.resource_group_name}-${random_string.cluster_id.result}"
  region              = var.region
}
