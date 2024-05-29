resource "aws_s3_object" "data" {
  bucket = var.destinations.aws_s3.bucket_id
  key    = var.destinations.aws_s3.object_path

  content = local.content
}