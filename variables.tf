variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  default     = "TerraformDemo"
  type        = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
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

variable "instance_type" {
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
