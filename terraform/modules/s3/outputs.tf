output "bucket_id" {
  description = "Expose bucket id (name)"
  value       = aws_s3_bucket.main2.id
}

output "bucket_arn" {
  description = "Expose bucket arn (AWS resources, necessary on IAM"
  value       = aws_s3_bucket.main2.arn
}
