variable "web_app_name" {
  type        = string
}
variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "service_plan_id" {
  type        = string
}

variable "always_on" {
    type = bool
    default = false
}

variable "app_settings" {
  type        = map(string)
  default     = {}
}

variable "tags" {
  type        = map(string)
  default     = {}
}
