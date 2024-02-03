terraform {
  backend "s3" {
    bucket = "aidoniesc"
    key    = "path/to/my/key"
    region = "us-east-2"
  }
}

