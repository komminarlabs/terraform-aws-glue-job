data "aws_iam_policy_document" "default" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["glue.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "default" {
  count              = var.role_arn == null ? 1 : 0
  name               = "GlueExecutionRole-${var.name}"
  assume_role_policy = data.aws_iam_policy_document.default.json
  tags               = var.tags
}

resource "aws_iam_role_policy" "default" {
  count  = var.role_arn == null && var.role_policy != null ? 1 : 0
  name   = "GlueExecutionRole-${var.name}"
  role   = aws_iam_role.default[0].id
  policy = var.role_policy
}

resource "aws_iam_role_policy_attachment" "default" {
  count      = var.role_arn == null ? 1 : 0
  role       = aws_iam_role.default[0].id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}
