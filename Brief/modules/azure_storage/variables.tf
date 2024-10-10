variable "resource_group_location" {
  type        = string
  default     = "francecentral"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  default     = "rg"
  description = "The resource group name."
}

variable "storage_account_name" {
  type        = string
  description = "The storage account name."
}

variable "storage_container_name" {
  type        = string
  description = "The storage container name."
}

variable "blob_name" {
  type        = string
  description = "The blob name."
}