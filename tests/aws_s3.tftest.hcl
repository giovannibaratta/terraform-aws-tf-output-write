run "aws_s3_object_is_generated" {

    variables {
        destinations = {
            aws_s3 = {
                bucket_id= "a-bucket"
                object_path = "a-path"
            }
        }
        
        data = {
            key = "value"
        }
    }

    command = plan

    assert {
        condition     = length(aws_s3_object.data) == 1
        error_message = "an aws s3 object should be generated"
    }
}