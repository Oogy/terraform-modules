variable "staging_cert" {
  type    = bool
  default = false
}

variable "key_type" {
  type    = string
  default = "RSA"
}

variable "rsa_bits" {
  type    = number
  default = 4096
}

variable "acme_reg_email" {
  type    = string
  default = null
}

variable "project_domain" {
  type    = string
  default = null
}
