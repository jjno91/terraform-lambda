data "aws_vpcs" "this" {
  count = 1

  tags = {
    type = "default"
  }
}

data "aws_subnets" "this" {
  count = length(data.aws_vpcs.this.ids) == 1 ? 1 : 0

  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.this.ids[0]]
  }

  tags = {
    type = "default"
  }
}
