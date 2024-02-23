variable "namespace" {
  type = string
}
variable "public_subnets" {
  type = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
  
}
variable "private_subnets" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
  
}
variable "cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "ssh_portnumber" {
  type = number
  default = 22
}
variable "all_port" {
  type = number
  default = 0
}
variable "allow_all" {
  type = string
  default = "0.0.0.0/0"
  
}
