locals {
  upload_to_aws_s3 = var.destinations.aws_s3 != null
}

resource "aws_s3_object" "data" {
  count = local.upload_to_aws_s3 ? 1 : 0

  bucket = var.destinations.aws_s3.bucket_id
  key    = var.destinations.aws_s3.object_path

  content = local.content
}