resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name

  tags = merge(var.tags,{"Name" = var.s3_bucket_name})
}

resource "aws_s3_bucket" "cloudtrail-s3bucket" {
  bucket = var.cloudtrailbucket
  force_destroy = true

  tags = merge(var.tags,{"Name" = var.cloudtrailbucket})
}