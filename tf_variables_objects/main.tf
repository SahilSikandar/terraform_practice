terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

locals {
  owner = "ABC"
  name = "MySERVER"
}

resource "aws_instance" "myserver" {
  ami           = "ami-0c0e147c706360bd7"
  instance_type = var.aws_instance_type


  tags = merge(var.additional_tags, {
    Name = local.name
  })
}