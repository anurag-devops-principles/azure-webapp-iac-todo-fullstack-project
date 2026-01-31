resource "azurerm_linux_web_app" "linux_web_app" {
  name                = var.web_app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id

  https_only = true

  site_config {
    always_on = var.always_on
  }

  app_settings = var.app_settings

  tags = var.tags
}
