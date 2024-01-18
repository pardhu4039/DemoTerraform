variable "ami" {
  description = "The ID of the AMI to use for the EC2 instance"
}

variable "instance_type" {
  description = "The type of EC2 instance"
}

variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instance will be launched"
}

variable "key_name" {
  description = "The name of the key pair to use for the EC2 instance"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to attach to the EC2 instance"
}
