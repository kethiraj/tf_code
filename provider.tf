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
