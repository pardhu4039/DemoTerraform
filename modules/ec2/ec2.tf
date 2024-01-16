resource "aws_instance" "example" {
  ami             = var.ami
  instance_type   = var.instance_type[0]
  tags = {
    Name = "example-instance"
  }
}
