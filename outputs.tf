output "arn" {
  value       = aws_glue_job.default.arn
  description = "The Glue job ARN"
}

output "id" {
  value       = aws_glue_job.default.id
  description = "The Glue job name"
}
