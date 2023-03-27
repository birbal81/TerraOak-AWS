resource "aws_s3_bucket_versioning" "s3_bucket_versioning_sac" {
  bucket = aws_s3_bucket.s3_bucket_sac.id
  versioning_configuration {
    status = "Disabled" # oak9: versioning_configuration.status should be set to any of enabled, true
  }
}