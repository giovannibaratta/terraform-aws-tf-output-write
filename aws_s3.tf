resource "aws_s3_object" "data" {
  bucket = var.destination.bucket_id
  key    = var.destination.object_path

  content = local.content
}