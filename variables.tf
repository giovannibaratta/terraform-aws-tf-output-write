variable "data" {
  description = "The content that must be JSON encoded and stored in the specified destinations"
  type        = map(any)
}

variable "destinations" {
  description = "The destinations where the data must be written. At least one destination must be selected."
  type = object({
    aws_s3 = optional(object({
      bucket_id   = string
      object_path = string
    }))

    local = optional(object({
      file_path = string
    }))
  })

  validation {
    error_message = "At least of destination must be selected"
    condition     = var.destinations.aws_s3 != null || var.destinations.local != null
  }
}