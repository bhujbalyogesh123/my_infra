output "website" {
  value = "${aws_elb.web.dns_name}"
}

terraform {
  backend "s3" {
    bucket = "7ambatch"
    key = "terraform_state/terraform.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "aws_s3" {
  backend = "s3"
  config {
    bucket = "7ambatch"
    key = "terraform_state/terraform.tfstate"
    region = "${var.region}"
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
  }
}
