resource "aws_lambda_function" "this" {
  count            = 1
  function_name    = var.name
  filename         = data.archive_file.this[0].output_path
  handler          = "index.handler"
  runtime          = "nodejs18.x"
  source_code_hash = data.archive_file.this[0].output_base64sha256
  role             = aws_iam_role.this[0].arn
}

data "archive_file" "this" {
  count       = 1
  type        = "zip"
  source_file = "test.js"
  output_path = "this.zip"
}
