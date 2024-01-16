variable "instance_type" {
    type = list(string)
    default = ["t3.micro","m5.large","m5.xlarge"]
}


variable "ami" {
  default = "ami-0ee2cdf834f8ec9ef"  
}



variable "instance_tags" {
  type    = map(string)
  default = {
    Name = "example-instance"
  }
}
