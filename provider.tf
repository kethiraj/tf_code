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
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Terraform" : "true"
  }
}

resource "aws_instance" "tf_course" {
  ami = "ami-0069731c25ae3be5b"
  instance_type = "t2.nano"

  vpc_security_group_ids = [
    aws_security_group.tf_course.id
  ]

  tags = {
    "Terraform" : "true"
  }
}

resource "aws_eip" "tf_course" {
  instance = aws_instance.tf_course.id
  tags = {
    "Terraform" : "true"
  }
} 
