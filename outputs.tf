output "arn" {
  value       = aws_glue_job.default.arn
  description = "The Glue job ARN"
}

output "id" {
  value       = aws_glue_job.default.id
  description = "The Glue job name"
}

output "trigger_arn" {
  value       = try(aws_glue_trigger.default.arn, null)
  description = "The Glue trigger ARN"
}

output "trigger_id" {
  value       = try(aws_glue_trigger.default.id, null)
  description = "The Glue trigger name"
}
