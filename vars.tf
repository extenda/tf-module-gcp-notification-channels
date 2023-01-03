variable "project" {
  type        = string
  description = "Project ID to create the notification channels in"
}

variable "notification_channels" {
  type        = any
  description = "List of the actual notification channel configs"
}

variable "slack_token_secret_project_id" {
  type        = string
  description = "Id of the project holding the secret"
  default     = ""
}

variable "slack_token_secret_name" {
  type        = string
  description = "Name of the actual secret that's holding the slack token"
  default     = ""
}
