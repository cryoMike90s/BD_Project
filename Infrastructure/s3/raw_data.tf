resource "aws_s3_bucket" "bd-raw-data" {
    bucket = "bd-raw-data"
}

# Server-Side Encryption Configuration
resource "aws_s3_bucket_server_side_encryption_configuration" "server-side-encryption" {
  bucket = aws_s3_bucket.bd-raw-data.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

# Versioning configuration
resource "aws_s3_bucket_versioning" "bucket-versioning" {
  bucket = aws_s3_bucket.bd-raw-data.id
  versioning_configuration {
    status = "Enabled"
  }
}