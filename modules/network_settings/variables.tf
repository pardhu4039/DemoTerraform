variable "vpc_cidr" {
    description = "CIDR block for VPC"
    type = string
    default = "10.0.0.0/16"  
}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "availability_zone" {
    type = list(string)
    default = [ 
        "ap-south-2a",
        "ap-south-2b",
        "ap-south-2c" ]  
}
