terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "2.43.0"
    }
  }
  backend "s3" {
    bucket = "demo-bucket-12344"
    key = "backend.tf"
    region = "us-east-1"
  }
}

provider "aws" {
  region="us-east-1"
}

resource "aws_instance" "myserver" {
  ami = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"
  tags = {
    name="my_Server"
  }
}
