data "vultr_region" "region" {
  filter {
    name   = "name"
    values = [var.region]
  }
}

data "vultr_plan" "server_plan" {
  filter {
    name   = "name"
    values = [var.server_plan]
  }
}

data "vultr_application" "application" {
  filter {
    name   = "deploy_name"
    values = [var.application]
  }
}

resource "vultr_server" "server" {
  count       = var.server_count
  region_id   = data.vultr_region.region.id
  plan_id     = data.vultr_plan.server_plan.id
  app_id      = data.vultr_application.application.id
  hostname    = var.project_component != null ? "${var.project_name}-${var.project_component}-${count.index}" : "${var.project_name}-${count.index}"
  label       = var.project_component != null ? "${var.project_name}-${var.project_component}-${count.index}" : "${var.project_name}-${count.index}"
  ssh_key_ids = var.module_ssh_keys
}
