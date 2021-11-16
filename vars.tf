variable tribe_project_id {
  type        = string
  description = "Project ID where the Monitoring resources will be created"
}

variable clan_name {
  type        = string
  description = "The name of the clan"
}

variable clan_group_email {
  type        = string
  description = "GSuite email of the clan group"
  default     = ""
}

variable clan_slack_channels {
  type = list(object({
    name   = string
  }))
  description = "The slack channels for alerts"
  default     = []
}

variable project_id_slack_token {
  type        = string
  description = "Project ID where an authorization token for a notification channel is stored"
  default     = ""
}
