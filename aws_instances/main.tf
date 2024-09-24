terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "2.43.0"
    }
  }
}

provider "aws" {
  region=var.region
}

resource "aws_instance" "myserver" {
  ami = var.ami
  instance_type = "t2.micro"
  tags = {
    name="my_Server"
  }
  
}