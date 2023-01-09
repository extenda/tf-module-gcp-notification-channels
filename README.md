# tf-module-gcp-notification-channels

## Inputs

| Name                          | Description                                 | Type        | Default | Required |
| ----------------------------- | ------------------------------------------- | ----------- | ------- | :------: |
| project                       | The project id to create the resources in   | `string`    | n/a     | __yes__  |
| notification_channels         | List of the actual notification channel configs - (See below)                                | `list(map)` | n/a     | __yes__  |
| slack_token_secret_project_id | Optional: To provide token with gcp secret. | `string`    | n/a     |    no    |
| slack_token_secret_name       | Optional: To provide token with gcp secret. | `string`    | n/a     |    no    |

## notification_channels

This variable variable holds a list of configs for the notification channels, and should be structured as shown below. \
[Terraform - Uptime checks](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/monitoring_uptime_check_config)

```hcl
notification_channels = list({

    slack = optional(list({
      channel_name = string            // 
      display_name = optional(string)  // (channel_name)
      enabled      = optional(boolean) // (true)
      description  = optional(string)  // ()
      user_labels  = optional(map({})) // () - If set merges with default_user_labels
      force_delete = optional(boolean) // (false) 
      auth_token   = optiona(string)   // if NOT set => fetches GCP secret with vars [slack_token_secret_project_id, slack_token_secret_name]
    }))

    email = optional(list({
      email_address = string            // 
      display_name  = optional(string)  // (email_address)
      enabled       = optional(boolean) // (true)
      description   = optional(string)  // ()
      user_labels   = optional(map({})) // () - If set => merges with default_user_labels
      force_delete  = optional(boolean) // (false) 
    }))

    sms = optional(list({
      number       = string            // 
      display_name = optional(string)  // (number)
      enabled      = optional(boolean) // (true)
      description  = optional(string)  // ()
      user_labels  = optional(map({})) // () - If set => merges with default_user_labels
      force_delete = optional(boolean) // (false) 
    }))

    pubsub = optional(list({
      topic        = string            // 
      display_name = optional(string)  // (topic)
      enabled      = optional(boolean) // (true)
      description  = optional(string)  // ()
      user_labels  = optional(map({})) // () - If set => merges with default_user_labels
      force_delete = optional(boolean) // (false) 
    }))

    webhook = optional(list({
      url          = string            // 
      display_name = optional(string)  // (topic)
      enabled      = optional(boolean) // (true)
      description  = optional(string)  // ()
      user_labels  = optional(map({})) // () - If set => merges with default_user_labels
      force_delete = optional(boolean) // (false) 
      username     = optional(string)  // () 
      password     = optional(string)  // () 
    }))

  })
```

## Outputs

| Name                   | Description                            |
| ---------------------- | -------------------------------------- |
| notification\_channels | map with created notification channels |
