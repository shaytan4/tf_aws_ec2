terraform {
  backend "s3" {
    bucket = "my-try-tf-ec2"
    key    = "tfec2/ec2_test1.tfstate" # tfstate is folder on bucket, tfmodule1 is object\file
    region = "eu-north-1"
  }
}