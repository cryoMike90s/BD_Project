resource "aws_s3_bucket" "bd-tfstate" {
    bucket = "bd-tfstate"
}

# Server-Side Encryption Configuration
resource "aws_s3_bucket_server_side_encryption_configuration" "server-side-encryption" {
  bucket = aws_s3_bucket.bd-tfstate.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

# Versioning configuration
resource "aws_s3_bucket_versioning" "bucket-versioning" {
  bucket = aws_s3_bucket.bd-tfstate.id
  versioning_configuration {
    status = "Enabled"
  }
}


output "s3_bucket_arn" {
  value       = aws_s3_bucket.bd-tfstate.arn
  description = "The ARN of the S3 bucket"
}