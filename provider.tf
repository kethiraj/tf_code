provider "aws" {
  profile = "default"
  region = "ap-south-1"
}

resource "aws_s3_bucket" "tf_course" {
  bucket = "ethirajtestbucket"
}

resource "aws_s3_bucket_acl" "tf_course" {
  bucket = aws_s3_bucket.tf_course.id
  acl    = "public-read-write"
}


resource "aws_default_vpc" "default" {}

resource "aws_security_group" "tf_course" {
  name        = "tf_course"
  description = "Allow Standard Ports"

  ingress {
    from_port  = 80
    to_port    = 80
    protocol   = "tcp"
    cidr_block = ["0.0.0.0/0"]
  }
  ingress {
    from_port  = 443
    to_port    = 443
    protocol   = "tcp"
    cidr_block = ["0.0.0.0/0"]
  }
  egress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = ["0.0.0.0/0"]
  }

  tags = {
    "Terraform" : "true"
  }
}
