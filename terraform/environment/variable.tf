variable "subscription_id" {
  type      = string
  sensitive = true
  default   = "bd7b142b-030a-46e3-8a31-579ffb9d2046"
}

variable "os_type" {
  type    = string
  default = "Linux"

  validation {
    condition     = contains(["Linux", "Windows"], var.os_type)
    error_message = "os_type must be either Linux or Windows."
  }
}

variable "sku_name" {
  type    = string
  default = "F1"
}

variable "always_on" {
  type    = bool
  default = false
}

variable "app_settings" {
  type    = map(string)
  default = {}
}
