resource "aws_s3_object" "data" {
  bucket = var.destination.aws_s3.bucket_id
  key    = var.destination.aws_s3.object_path

  content = local.content
}