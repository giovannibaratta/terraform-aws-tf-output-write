run "local_file_is_generated" {

    variables {
        destinations = {
            local = {
                file_path = "test_file.json"
            }
        }
        
        data = {
            key = "value"
        }
    }

    command = plan

    assert {
        condition     = length(local_file.data) == 1
        error_message = "a local file should be generated"
    }
}