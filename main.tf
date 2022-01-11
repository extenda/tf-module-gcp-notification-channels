data "google_secret_manager_secret_version" "monitoring_slack_token" {
  project = var.project_id_slack_token
  secret  = "monitoring-slack-token"
}

resource "google_monitoring_notification_channel" "clan_email" {
  count        = var.clan_group_email != "" ? 1 : 0
  project      = var.tribe_project_id
  display_name = "Email channel for ${var.clan_name} clan"
  type         = "email"
  labels = {
    email_address = var.clan_group_email
  }
}

resource "google_monitoring_notification_channel" "clan_slack_channels" {
  for_each = {
    for channel in var.clan_slack_channels :
    channel.name => channel
  }
  
  project      = var.tribe_project_id
  display_name = "Slack channel for ${var.clan_name} clan: ${each.value.name}"
  type         = "slack"
  labels = {
    channel_name = each.value.name
  }
  sensitive_labels {
    auth_token = data.google_secret_manager_secret_version.monitoring_slack_token.secret_data
  }
}
