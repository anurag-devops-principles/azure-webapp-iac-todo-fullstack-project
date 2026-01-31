output "web_app_ids" {
  value = {
    hostname = azurerm_linux_web_app.linux_web_app.default_hostname
    url      = "https://${azurerm_linux_web_app.linux_web_app.default_hostname}"
    id       = azurerm_linux_web_app.linux_web_app.id
  }
}
