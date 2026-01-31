output "resource_group_ids" {
  value = module.resource_group.resource_group_ids
}

output "app_service_plan_ids" {
  value = module.app_service_plan.app_service_plan_ids
}

output "web_app_ids" {
  value = module.linux_web_app.web_app_ids
}
