resource "aws_cloudwatch_event_rule" "this" {
  count               = 0
  name_prefix         = "lambda-${var.name}-"
  schedule_expression = var.schedule_expression
}

resource "aws_cloudwatch_event_target" "this" {
  count = 0
  rule  = aws_cloudwatch_event_rule.this[0].name
  arn   = aws_lambda_function.this[0].arn
}

resource "aws_lambda_permission" "this" {
  count         = 0
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this[0].function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.this[0].arn
}
