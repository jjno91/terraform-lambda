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
}

data "archive_file" "this" {
  count       = 1
  type        = "zip"
  source_file = "test.js"
  output_path = "this.zip"
}
