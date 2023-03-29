resource "aws_s3_bucket" "s3_bucket_sac" {
  # oak9: Design S3 Object Ownership to use Bucket Owner Enforced instead of Bucket Owner Preferred to align with AWS best practices
  force_destroy       = false
  object_lock_enabled = false
}

resource "aws_s3_bucket_ownership_controls" "s3_ownership_controls_sac" {
  bucket = aws_s3_bucket.s3_bucket_sac.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}