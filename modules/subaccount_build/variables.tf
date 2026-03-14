variable "project_name" {
  description = "Name of the project the subaccount belongs to."
  type        = string
}

variable "stage" {
  description = "Stage of the subaccount to be created."
  type        = string
  validation {
    condition     = contains(["SBX", "DEV", "QAS", "PRD"], var.stage)
    error_message = "Stage must be one of SBX, DEV, QAS or PRD."
  }
}

variable "subaccount_region" {
  description = "Region where the subaccount shall be created in."
  type        = string
}

variable "parent_id" {
  description = "Parent ID for the subaccount."
  type        = string
}