output "bucket-name" {
  value = aws_s3_bucket.s3_bucket.bucket
}
output "dynamodb-table" {
  value = aws_dynamodb_table.lock_table.name
}