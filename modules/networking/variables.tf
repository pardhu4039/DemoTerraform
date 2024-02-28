variable "namespace" {
  type = string
}
variable "public_subnets" {
  type    = list(string)
  default = []
  
}
variable "private_subnets" {
  type    = list(string)
  default = []
}
variable "cidr" {
  type = string
}

variable "ssh_portnumber" {
  type = number
}

variable "all_port" {
  type = number
}

variable "allow_all" {
  type = string
}
variable "environment" {
  type = string
}
