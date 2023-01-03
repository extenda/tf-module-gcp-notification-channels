module "notification_channels" {
  source                        = "../"
  project                       = "my-project-123"
  notification_channels         = yamldecode(file("channels.yaml"))
  slack_token_secret_project_id = "my-project-123" # Optional; to provide token with gcp stored secret
  slack_token_secret_name       = "my-slack-token" # Optional; to provide token with gcp stored secret
}
