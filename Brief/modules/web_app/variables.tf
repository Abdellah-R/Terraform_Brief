variable "app_service_name" {
    type = string
    description = "The web app name"
}
variable "app_service_plan_name" {
    type = string
    description = "The app service plan name"
}
variable "resource_group_location" {
  type        = string
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name."
}