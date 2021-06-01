variable "azs" {
  type    = list(string)
  default = []
}
variable "volume-type" {
  type    = string
  default = ""
}

variable "extra-volume-size" {
  type = string
  default = ""  
}
variable "volume-termination-role" {}

variable "instances-id" {
  type = list(string) 
  default = []
}
variable "volumename" {
  type = list(string)
  default = []
}


