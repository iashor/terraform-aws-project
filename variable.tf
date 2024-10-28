variable "region" {
  type    = string 
  default = "eu-west-1"
}

variable "ami" {
  type    = string 
  default = "ami-00385a401487aefa4" 
}

variable "public_key" {
  description = "SSH public key"
  type        = string
}

