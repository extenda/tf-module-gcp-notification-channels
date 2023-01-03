variable project {
  type        = string
  description = "Project ID to create the notification channels in"
}

variable notification_channels {
  type        = any
  description = "List of the actual notification channel configs"
}

variable slack_token_project {
  type        = string
  description = "Project ID where an authorization token for a notification channel is stored"
  default     = ""
}

variable slack_token_secret {
  type        = string
  description = "Name of the actual secret that's holding the slack token"
  default     = ""
}
