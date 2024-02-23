variable "namespace" {
  type = string
}

variable "vpc" {
  type = any
}

variable key_name {
  type = string
}

variable "sg_pub_id" {
  type = any
}

variable "sg_priv_id" {
  type = any
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "public_subnet_id" {
  type =string
}

variable "private_subnet_id" {
  type= string
}
