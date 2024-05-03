resource "aws_iam_role" "this" {
  count              = 1
  name_prefix        = "lambda-${var.name}-"
  assume_role_policy = data.aws_iam_policy_document.this[0].json

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_iam_policy_document" "this" {
  count = 1

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}
