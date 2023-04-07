resource "aws_s3_bucket_public_access_block" "s3_public_access_block_sac" {
  bucket = aws_s3_bucket.s3_bucket_sac.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}