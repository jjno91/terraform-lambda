resource "aws_iam_role" "this" {
  count                 = 1
  name_prefix           = "${var.name}-lambda-"
  assume_role_policy    = data.aws_iam_policy_document.this[0].json
  force_detach_policies = true
  inline_policy {}

  managed_policy_arns   = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
    "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
  ]

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
