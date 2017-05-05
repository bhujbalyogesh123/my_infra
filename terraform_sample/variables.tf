variable "access_key" {
  default = ""
}

variable "secret_key" {
  default = ""
}

variable "region" {
  default = "us-east-2"
}

variable "amis" {
  type = "map"
  default = {
    us-east-1 = "ami-c58c1dd3"
    us-east-2 = "ami-4191b524"
    us-west-1 = "ami-7a85a01a"
    us-west-2 = "ami-4836a428"
  }
}
