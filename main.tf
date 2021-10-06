locals {
  trigger_actions = var.trigger_actions == {} && (var.trigger_type == "ON_DEMAND" || var.trigger_type == "SCHEDULED") ? { job_name = aws_glue_job.default.name } : var.trigger_actions
}

data "aws_iam_policy_document" "default" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["glue.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "default" {
  count              = var.role_arn == null ? 1 : 0
  name               = "GlueRole-${var.name}"
  assume_role_policy = data.aws_iam_policy_document.default.json
  tags               = var.tags
}

resource "aws_iam_role_policy" "default" {
  count  = var.role_arn == null ? 1 : 0
  name   = "GlueRole-${var.name}"
  role   = aws_iam_role.default[0].id
  policy = var.policy
}

resource "aws_iam_role_policy_attachment" "default" {
  count      = var.role_arn == null ? 1 : 0
  role       = aws_iam_role.default[0].id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

resource "aws_glue_job" "default" {
  name              = var.name
  connections       = var.connections
  default_arguments = var.default_arguments
  glue_version      = var.glue_version
  max_capacity      = var.max_capacity
  max_retries       = var.max_retries
  number_of_workers = var.number_of_workers
  role_arn          = var.role_arn != null ? var.role_arn : aws_iam_role.default[0].arn
  worker_type       = var.worker_type
  tags              = var.tags

  command {
    name            = var.command_name
    python_version  = var.python_version
    script_location = var.script_location
  }
}

resource "aws_glue_trigger" "default" {
  name      = var.name
  actions   = local.trigger_actions
  enabled   = var.schedule_active
  predicate = var.trigger_predicate
  schedule  = var.schedule
  type      = var.trigger_type
  tags      = var.tags
}
