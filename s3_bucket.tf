resource "aws_s3_bucket" "S3_bucket" {
  bucket = var.domain
  acl    = "private"

  tags = {
    Name        = var.domain
    Environment = "testing"
  }
}
