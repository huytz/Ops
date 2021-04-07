terraform {
  backend "s3" {
    bucket             = "terraform-tfstate-369537814977"
    key                = "production"
    region             = "ap-southeast-1"
    dynamodb_table     = "terraform_locks"
  }
}
