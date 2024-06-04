variable "data" {
  description = "The content that must be JSON encoded and stored in the specified destinations"
  type        = any
}

variable "destination" {
  description = "The destination where the data must be written"
  type = object({
    bucket_id   = string
    object_path = string
  })
}