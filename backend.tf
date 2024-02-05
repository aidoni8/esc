terraform {
  backend "s3" {
    bucket = "aidoniesc"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}

