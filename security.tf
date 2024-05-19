resource "aws_security_group" "this" {
  count       = length(data.aws_vpcs.this[0].ids) == 1 ? 1 : 0
  name_prefix = "${var.name}-"
  vpc_id      = data.aws_vpcs.this[0].ids[0]
  ingress     = []

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}
