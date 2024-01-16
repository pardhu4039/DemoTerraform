resource "aws_instance" "example" {
  ami             = var.ami
  instance_type   = var.instance_type[0]
  tags = {
    Name = "example-instance"
  }
}

resource "aws_eip" "lb" {
  instance = aws_instance.example.id
  domain   = "vpc"
}
