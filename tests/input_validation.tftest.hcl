run "at_least_of_destination_must_be_set" {

    variables {
        destinations = {}
        
        data = {
            key = "value"
        }
    }

    command = plan

    expect_failures = [ var.destinations ]
}