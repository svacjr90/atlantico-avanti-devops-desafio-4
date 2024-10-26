variable "my_ip" { # in default.auto.tfvars
  description = "Valor do meu IP seguido por /32."
  type        = string
}

variable "key_name" {
  description = "Nome do key pair na AWS."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "ami" {
  description = "Amazon Machine Image ID."
  type        = string
}