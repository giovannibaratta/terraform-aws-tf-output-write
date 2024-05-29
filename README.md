# terraform-output-write

Terraform module to write generic data in JSON format to multiple destinations.

The supported destinations are:
* AWS S3 bucket
* local file

## Usage

```hcl
module "my-data" {
    source       = "giovannibaratta/tf-output-write/aws"

    destinations = {
        aws_s3 = {
            bucket_id = "my-bucket"
            object_path = "test.json"
        }
    }

    data         = {
        key = value
    }
}
```