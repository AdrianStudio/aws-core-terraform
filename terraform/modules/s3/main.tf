resource "aws_s3_bucket" "main2" {
  bucket = var.bucket_name
  tags = {
    Name        = "${var.project_name}-${var.environment}-s3"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.main2.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "main" {
  bucket = aws_s3_bucket.main2.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = "aws/s3"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "main" {
  bucket                  = aws_s3_bucket.main2.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_logging" "main" {
  bucket        = aws_s3_bucket.main2.id
  target_bucket = aws_s3_bucket.main2.id
  target_prefix = "logs/"
}
