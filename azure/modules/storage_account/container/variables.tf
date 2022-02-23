variable "storage_account_name" {
  type        = string
  default     = ""
  description = "(Required) Reference Storage Account Name"
}

variable "settings" {
  default     = {}
  description = "(Required) Used to handle passthrough parameters"
}