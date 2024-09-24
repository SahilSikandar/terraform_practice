terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "2.43.0"
    }
  }
}

provider "aws" {
  region="us-east-1"
}

resource "aws_s3_bucket" "demo-bucket" {
    bucket = "demo_bucket_12344"
}

resource "aws_s3_bucket_object" "demo_store" {
    bucket = aws_s3_bucket.demo_bucket.bucket
    source = "./main.txt"
    key = "mydemofile/demo_data.txt"
  
}