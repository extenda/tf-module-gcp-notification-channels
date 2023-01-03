module "notification_channels" {
  source                = "../"
  project               = "hiiretail-monitoring-prod-6500"
  notification_channels = yamldecode(file("channels.yaml"))
}
