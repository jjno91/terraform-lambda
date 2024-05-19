variable "name" {
  type    = string
  default = "terraform"
}

variable "schedule_expression" {
  type        = string
  default     = null
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule#schedule_expression"
}

variable "image" {
  type = string
}
