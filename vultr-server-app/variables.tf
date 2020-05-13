variable "region" {
  type    = string
  default = "New Jersey"
}

variable "server_count" {
  type    = number
  default = 1
}

variable "server_plan" {
  type    = string
  default = "2048 MB RAM,55 GB SSD,2.00 TB BW"
}

variable "application" {
  type    = string
  default = "Docker on Ubuntu 18.04 x64"
}

variable "module_ssh_keys" {
  type    = list(string)
  default = ["empty"]
}

variable "project_name" {
  type    = string
  default = "project-name"
}

variable "project_component" {
  type    = string
  default = "docker"
}
