data "ns_connection" "sns-topic" {
  name     = "sns-topic"
  contract = "datastore/aws/sns"
}

locals {
  topic_name  = data.ns_connection.sns-topic.outputs.topic_name
  topic_arn   = data.ns_connection.sns-topic.outputs.topic_arn
  kms_key_id  = try(data.ns_connection.sns-topic.outputs.kms_key_id, "")
  kms_key_arn = local.kms_key_id == "" ? "" : data.aws_kms_key.sqs_key[0].arn
}

data "aws_kms_key" "sqs_key" {
  count  = local.kms_key_id == "" ? 0 : 1
  key_id = local.kms_key_id
}
