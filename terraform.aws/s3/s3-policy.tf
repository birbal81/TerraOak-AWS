resource "aws_s3_bucket_policy" "s3_bucket_policy_sac" {
  bucket = aws_s3_bucket.s3_bucket_sac.id
  policy = <<EOF
  # oak9: Explicitly define allowed principals for S3 bucket instead of using wildcards ['*'] to restrict broad access
  # oak9: Explicitly define S3 bucket actions instead of using wildcards ['*']
{
"Version": "2012-10-17",
"Id": "PutObjPolicy",
"Statement": [{
  "Sid": "DenyObjectsThatAreNotSSEKMS",
  "Principal": "*",
  "Effect": "Allow",
  "Action": "*",
  "Resource": "${aws_s3_bucket.s3_bucket_sac.arn}/*",
  "Condition": {
    "Null": {
      "s3:x-amz-server-side-encryption-aws-kms-key-id": "true"
    }
  }
}]
}
EOF
}