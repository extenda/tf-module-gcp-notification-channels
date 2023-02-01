# Supported types: ["webhook", "slack", "email", "sms", "pubsub"]

output "notification_channels" {
  value = merge(
    { for nc in google_monitoring_notification_channel.sms : nc.display_name => nc.id },
    { for nc in google_monitoring_notification_channel.webhook_tokenauth : nc.display_name => nc.id },
    { for nc in google_monitoring_notification_channel.webhook_basicauth : nc.display_name => nc.id },
    { for nc in google_monitoring_notification_channel.pubsub : nc.display_name => nc.id },
    { for nc in google_monitoring_notification_channel.slack : nc.display_name => nc.id },
    { for nc in google_monitoring_notification_channel.email : nc.display_name => nc.id },
  )

  description = "Map of display_name => id"
}

output "fallback_channels_ids" {
  value = concat(
    [for nc in google_monitoring_notification_channel.sms : nc.id if try(nc.user_labels.fallback_channel, false) ],
    [for nc in google_monitoring_notification_channel.webhook_tokenauth : nc.id if try(nc.user_labels.fallback_channel, false) ],
    [for nc in google_monitoring_notification_channel.webhook_basicauth : nc.id if try(nc.user_labels.fallback_channel, false) ],
    [for nc in google_monitoring_notification_channel.pubsub : nc.id if try(nc.user_labels.fallback_channel, false) ],
    [for nc in google_monitoring_notification_channel.slack : nc.id if try(nc.user_labels.fallback_channel, false) ],
    [for nc in google_monitoring_notification_channel.email : nc.id if try(nc.user_labels.fallback_channel, false) ],
  )

  description = "Ids of fallback_channels"
}
