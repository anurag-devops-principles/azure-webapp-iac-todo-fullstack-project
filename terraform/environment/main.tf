module "resource_group" {
  source = "../modules/azurerm_resource_group"

  resource_group_name = "${local.name_pattern}-rg"
  location            = local.location

  tags = local.common_tags
}

module "app_service_plan" {
  source = "../modules/azurerm_service_plan"

  app_service_plan_name = "${local.name_pattern}-asp"
  location              = local.location
  resource_group_name   = module.resource_group.resource_group_ids.name
  os_type               = var.os_type
  sku_name              = var.sku_name

  tags = local.common_tags
}

module "linux_web_app" {
  source = "../modules/azurerm_linux_web_app"

  web_app_name        = "${local.name_pattern}-application"
  location            = local.location
  resource_group_name = module.resource_group.resource_group_ids.name
  service_plan_id     = module.app_service_plan.app_service_plan_ids.id
  always_on           = var.always_on
  app_settings        = var.app_settings

  tags = local.common_tags
}
