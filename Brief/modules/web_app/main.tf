data "azurerm_app_service_plan" "az_service_plan" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_app_service" "appweb" {
  name                = var.app_service_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  app_service_plan_id = data.azurerm_app_service_plan.az_service_plan.id
}