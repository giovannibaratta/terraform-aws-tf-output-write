# terraform-output-write

Terraform module to write generic data in JSON format to a AWS S3 bucket.

## Usage

```hcl
module "my-data" {
    source       = "giovannibaratta/tf-output-write/aws"

    destination = {
        bucket_id = "my-bucket"
        object_path = "test.json"
    }

    data         = {
        key = value
    }
}
```