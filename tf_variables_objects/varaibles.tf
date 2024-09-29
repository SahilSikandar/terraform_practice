variable "aws_instance_type" {
    description = "What type of aws instance?"
    type = string
    validation {
      condition = var.aws_instance_type=="t2.micro"
      error_message = "only t2.micro to be used!!"
    }
  
}
variable "additional_tags" {
  type = map(string) #expecting key=value format
  default = {}
}