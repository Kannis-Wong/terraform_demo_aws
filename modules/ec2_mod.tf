resource "aws_instance" "terra_server" {
  ami           = var.ami
  instance_type = var.type
  subnet_id     = var.subnet
  tags          = var.tag
}

output "instance_id" {
  value = aws_instance.terra_server.id
}
