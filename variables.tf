variable "subnet_prefix" {
  description = "cidr block"
  type = string
}

variable "provisioned" {
  type = string
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "availability_zone_1" {
  type = string
  default = "us-east-1a"
}

variable "keypair" {
  type = string
}

variable "creds_path" {
  type = string
}

variable "my_ip" {
  type = string
  default = "0.0.0.0/0"
}

variable "ami" {
  type = string
  default = "ami-09e67e426f25ce0d7"
}