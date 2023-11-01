output "env" {
  value = [
    {
      name  = "SNS_TOPIC_NAME"
      value = local.topic_name
    },
    {
      name  = "SNS_TOPIC_ARN"
      value = local.topic_arn
    }
  ]
}