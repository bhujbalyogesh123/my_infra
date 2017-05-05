provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

resource "aws_instance" "sample" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.sample.public_ip} > pub_ip.txt"
  }
}

resource "aws_eip" "ip" {
    instance = "${aws_instance.sample.id}"
}

terraform {
  backend "s3" {
    bucket = "7ambatch"
    key = "terraform/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "aws_s3" {
  backend = "s3"
  config {
    bucket = "7ambatch"
    key = "terraform/terraform.tfstate"
    region = "us-east-2"
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
  }
}
