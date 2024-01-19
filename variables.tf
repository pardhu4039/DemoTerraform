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
