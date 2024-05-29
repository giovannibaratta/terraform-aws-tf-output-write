locals {
  content = jsonencode({
    for k, v in var.data : k => v if v != null
  })
}