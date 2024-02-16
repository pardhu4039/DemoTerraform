variable "namespace" {
  type = string
}

variable "private_subnets"{
description = "Private subnet cidrs"
type = string
}

variable "public_subnets"{
description = "Public subnet cidrs"
type = string
}

variable "main_cidr"{
description = "Main cidr"
type = string
}

