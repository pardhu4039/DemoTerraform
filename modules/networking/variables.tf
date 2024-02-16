variable "namespace" {
  type = string
}

variable "private_subnet"{
description = "Private subnet cidrs"
type = string
}

variable "public_subnet"{
description = "Public subnet cidrs"
type = string
}

variable "main_cidr"{
description = "Main cidr"
type = string
}

