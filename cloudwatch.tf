resource "aws_cloudwatch_log_group" "default" {
  name              = "/aws/glue/jobs/${var.name}"
  retention_in_days = var.log_retention_days
}
