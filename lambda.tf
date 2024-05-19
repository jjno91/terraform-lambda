# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function
resource "aws_lambda_function" "this" {
  count         = 1
  function_name = var.name
  role          = aws_iam_role.this[0].arn
  package_type  = "Image"
  image_uri     = var.image

  image_config {
    command = [var.command]
  }

  dynamic "vpc_config" {
    for_each = length(data.aws_vpcs.this[0].ids) == 1 ? [1] : []

    content {
      security_group_ids = [aws_security_group.this[0].id]
      subnet_ids         = data.aws_subnets.this[0].ids
    }
  }
}
