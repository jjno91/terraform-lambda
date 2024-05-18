terraform {
  backend "s3" {
    bucket = "terraform-backend-20221231194343357900000001"
    key    = "terraform-lambda"
  }
}
