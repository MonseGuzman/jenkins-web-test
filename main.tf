# provider "aws" {
#   region = "us-west-2"
# }

resource "random_string" "prefix" {
  length  = 12
  upper   = false
  number  = false
  special = false
}

resource "aws_s3_bucket" "b" {
  bucket = "monse-${random_string.prefix.result}"
  acl    = "private"
}