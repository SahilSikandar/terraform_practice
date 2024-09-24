variable "region" {
  type        = string
  default     = "us-east-1"
  description = "This is the description of region"
}

variable "ami" {
  default="ami-0e86e20dae9224db8"
  type = string
  description = "this ami id"
}