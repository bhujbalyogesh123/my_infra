variable "access_key" {
  default = ""
}

variable "secret_key" {
  default = ""
}

variable "region" {
  default = "us-east-2"
}

variable "key_name" {
  description = "Name of your AWS keypair"
  default = "my_key"
}

variable "public_key_path" {
  description = "Path to your public key"
  default = "/home/ec2-user/.ssh/authorized_keys"
}

variable "private_key_path" {
  description = "Path to your private key"
  default = "/root/my_infra/11-apr-17-ohio.pem"
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
