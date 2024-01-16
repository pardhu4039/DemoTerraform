resource "aws_instance" "my_instance" {
  ami             = var.ami
  instance_type   = var.instance_type[0]
  subnet_id       = "${aws_subnet.public_subnet.id}"
  associate_public_ip_address = true
  tags = {
    Name = "TerrafromDemo"
  }
}
