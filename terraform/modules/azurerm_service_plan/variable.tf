variable "app_service_plan_name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "os_type" {
  type        = string
  default     = "Linux"

  validation {
    condition     = contains(["Linux", "Windows"], var.os_type)
    error_message = "os_type must be either Linux or Windows."
  }
}

variable "sku_name" {
  type        = string
  default     = "F1"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
