output notification_channels {
  description = "The list of notification channels"
  value       = [
    for name, channel in google_monitoring_notification_channel.clan_slack_channels :
    channel.name
  ]
  sensitive   = true
}
