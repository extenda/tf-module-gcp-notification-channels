# Supported types: ["webhook", "slack", "email", "sms", "pubsub"]

output "notification_channels" {
  value = merge(
    { for nc in google_monitoring_notification_channel.slack : nc.display_name => nc.id },
    { for nc in google_monitoring_notification_channel.webhook_tokenauth : nc.display_name => nc.id },
    { for nc in google_monitoring_notification_channel.webhook_basicauth : nc.display_name => nc.id },
    { for nc in google_monitoring_notification_channel.email : nc.display_name => nc.id },
    { for nc in google_monitoring_notification_channel.sms : nc.display_name => nc.id },
    { for nc in google_monitoring_notification_channel.pubsub : nc.display_name => nc.id },
  )

  description = "Channels"
}
