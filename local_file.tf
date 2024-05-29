locals {
  store_locally = var.destinations.local != null
}

resource "local_file" "data" {
  count = local.store_locally ? 1 : 0

  content  = local.content
  filename = var.destinations.local.file_path
}