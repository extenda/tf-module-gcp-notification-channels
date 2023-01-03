# Supported types: ["webhook", "slack", "email", "sms", "pubsub"]

output "webhook" {
  value = {
    for nc in merge(
        google_monitoring_notification_channel.slack,
        google_monitoring_notification_channel.webhook_tokenauth,
        google_monitoring_notification_channel.webhook_basicauth,
        google_monitoring_notification_channel.email,
        google_monitoring_notification_channel.sms,
        google_monitoring_notification_channel.pubsub
    ) : nc.display_name => nc
  }
  description = "Webhook Channels"
}
