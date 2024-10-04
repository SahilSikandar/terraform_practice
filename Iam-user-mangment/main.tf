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
  users_data= yamldecode(file("./user.yml")).users
  user_roles= flatten([for user in local.users_data:[for user_role in user.roles:{
    username= user.username
    role= user_role
  }]])
}
output "user" {
   value = local.users_data
}

resource "aws_iam_user" "users" {
    for_each =  toset(local.users_data[*].username)
    name = each.value
  
}

//password creations
resource "aws_iam_user_login_profile" "profile" {
  for_each        = aws_iam_user.users
  user            = each.value.name
  password_length = 12

  lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required,
      pgp_key,
    ]
  }
}


resource "aws_iam_user_policy_attachment" "main" {
    for_each = {for pair in local.user_roles:"${pair.username}-${pair.role}"=> pair}
    user = aws_iam_user.users[each.value.username].name
    policy_arn = "arn:aws:iam::aws:policy/${each.value.role}"

  
}