provider "aws" {
  region = "us-west-2"
}

module "module" {
  source = "../"
}