variable "aws_access_key" {
  type = string
}
variable "aws_secret_key" {
  type = string
}

variable "region"{
    type = string
    description = "used for selecting location"
    default = "ap-south-2"
}


