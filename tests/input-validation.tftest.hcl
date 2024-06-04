mock_provider "aws" {}

run "it_should_accept_a_map_of_string" {

  variables {
    destination = {
      bucket_id   = "12345"
      object_path = "my_file.json"
    }

    data = {
      key = "value"
    }
  }

  command = plan

  assert {
    condition     = jsondecode(local.content)["key"] == var.data.key
    error_message = "the content should contain the key and value"
  }
}

run "it_should_accept_a_plain_string" {

  variables {
    destination = {
      bucket_id   = "12345"
      object_path = "my_file.json"
    }

    data = "value"
  }

  command = plan

  assert {
    condition     = jsondecode(local.content) == var.data
    error_message = "the content should the plain value"
  }
}

run "it_should_accept_a_number" {

  variables {
    destination = {
      bucket_id   = "12345"
      object_path = "my_file.json"
    }

    data = 12345
  }

  command = plan

  assert {
    condition     = jsondecode(local.content) == var.data
    error_message = "the content should the number"
  }
}

run "it_should_accept_a_complex_object" {

  variables {
    destination = {
      bucket_id   = "12345"
      object_path = "my_file.json"
    }

    data = {
      nested-object = {
        second-level = "another-value"
      }
      nullable-value = null
    }
  }

  command = plan

  assert {
    condition     = jsondecode(local.content)["nested-object"]["second-level"] == var.data["nested-object"]["second-level"]
    error_message = "the nested object should match the input value"
  }

  assert {
    condition     = jsondecode(local.content)["nullable-value"] == null
    error_message = "the nullable value should have a null value"
  }
}