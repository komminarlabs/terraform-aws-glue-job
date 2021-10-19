module "example_glue_job" {
  source            = "github.com/komminar/terraform-aws-glue-job?ref=v0.1.0"
  name              = "example-glue-job"
  max_retries       = 1
  number_of_workers = 2
  schedule          = "cron(0 12 * * ? *)"
  script_location   = "S3://example-bucket/location/script.py"
  trigger_type      = "SCHEDULED"
  worker_type       = "Standard"

  default_arguments = {
    "--VAR1" = "some value"
  }

  tags = {
    Environment = "development"
    Stack       = "glue"
  }
}
