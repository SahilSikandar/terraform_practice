output "instance_public_ip" {
    description = "this public ip address"
    value = aws_instance.ngnix-server.public_ip
  
}
output "public_url" {
    description = "this public url"
    value = "https://${aws_instance.ngnix-server.public_ip}"
  
}