
variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  default     = "7ae7c7b3-5a6a-4fef-90a8-7488276306be"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-terraform-learning-001"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "uksouth"
}

variable "app_service_plan" {
  description = "Name of "
  type        = string
  default     = "asp-terraform-learning-001"
}

variable "app_service" {
  description = "Name of "
  type        = string
  default     = "as-terraform-learning-001"
}

variable "storage_account" {
  description = "Name of "
  type        = string
  default     = "salearning001"
}


variable "sql_server" {
  description = "Name of "
  type        = string
  default     = "mssqlslearning"
}

variable "sql_database" {
  description = "Name of "
  type        = string
  default     = "mssqldblearning"
}

variable "key_vault" {
  description = "Name of "
  type        = string
  default     = "kvlearning"
}

variable "application_insights" {
  description = "Name of "
  type        = string
  default     = "apilearning"
}

variable "log_analytics_workspace" {
  description = "Name of "
  type        = string
  default     = "lawlearning"
}

variable "virtual_network" {
  description = "Name of "
  type        = string
  default     = "vnlearning"
}

variable "subnet" {
  description = "Name of "
  type        = string
  default     = "subnetlearning"
}

variable "network_security_group" {
  description = "Name of "
  type        = string
  default     = "nsglearning"
}

variable "network_security_rule" {
  description = "Name of "
  type        = string
  default     = "nsrlearning"
}


variable "nic" {
  description = "Name of "
  type        = string
  default     = "learning-nic"
}

variable "runner_vm" {
  description = "Name of "
  type        = string
  default     = "learning-lin-vm"

}

variable "runner_ssh_public_key" {
  type        = string
  description = "Public SSH key for the Linux runner VM"
}