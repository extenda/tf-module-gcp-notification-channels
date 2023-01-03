# tf-module-gcp-notification-channels

## Inputs

| Name                          | Description                                 | Type        | Default | Required |
| ----------------------------- | ------------------------------------------- | ----------- | ------- | :------: |
| project_id                    | The project id to create the resources in   | `string`    | n/a     | __yes__  |
| notification_channels         | List of alert policies configurations       | `list(map)` | n/a     | __yes__  |
| slack_token_secret_project_id | Optional: To provide token with gcp secret. | `string`    | n/a     |    no    |
| slack_token_secret_name       | Optional: To provide token with gcp secret. | `string`    | n/a     |    no    |

## Outputs

| Name                   | Description                            |
| ---------------------- | -------------------------------------- |
| notification\_channels | map with created notification channels |
