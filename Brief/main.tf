module "azure_storage"{
    source = "./modules/azure_storage"

    resource_group_location = var.resource_group_location
    resource_group_name = var.resource_group_name
    storage_account_name = var.storage_account_name
    storage_container_name = var.storage_container_name
    blob_name = var.blob_name
   
   
}

module "web_app" {
    source = "./modules/web_app"

    resource_group_location = var.resource_group_location
    resource_group_name = var.resource_group_name
    app_service_name = var.app_service_name
    app_service_plan_name = var.app_service_plan_name
    depends_on = [ module.azure_storage ]  
}

module "vm" {
    source = "./modules/vm"

    resource_group_location = var.resource_group_location
    resource_group_name = var.resource_group_name
    storage_account_name = var.storage_account_name
    vm_name = var.vm_name
    username = var.username
    network_interface_name = var.network_interface_name
    depends_on = [ module.azure_storage ]
}