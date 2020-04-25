resource "aws_s3_bucket" "log_bucket" {
  bucket = "trails-log-bucket"
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket" "trails-active-storage" {
  bucket = "trails-active-storage-bucket-dev"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }

  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/"
  }
}
