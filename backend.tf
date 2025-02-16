# create s3 for state file & create dynamodb for state lock
terraform {
  backend "s3" {
    bucket         = "name_of_bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "name_of_table"
  }
}
