variable "resource_group_location" {
  type        = string
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  description = "The resource group name."
}

variable "network_interface_name" {
  type        = string
  description = "The network interface name."
}

variable "storage_account_name" {
  type        = string
  description = "The storage account name."
}

variable "vm_name" {
  type        = string
  description = "The virtual machine name."
}

variable "username" {
  type        = string
  description = "The username for the local account that will be created on the new VM."
}