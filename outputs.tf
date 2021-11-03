output notification_channel_name {
  description = "The list of notification channels"
  value       = google_monitoring_notification_channel.clan_slack_channel.*
  sensitive   = true
}
