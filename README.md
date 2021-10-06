# terraform-aws-glue-job

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | >= 3.10 |

## Usage

```
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
```

## Inputs

| Name | Description | Type | Default | Required |
|------|---------| ---------| ---------| ---------|
| name | The name of the Glue job | string| n/a | yes |
| command_name | The name of the job command | string | glueetl | no |
| connections | A list with connections for this job | list(string) | [] | no |
| default_arguments | A map with default arguments for the job | map(string) | {} | no |
| glue_version | The Glue version to use | string | 2.0 | no |
| max_capacity | The maximum number of data processing units that can be allocated | number | null | no |
| max_retries | The maximum number of times to retry the failing job | number | 0 | no |
| number_of_workers | The number of workers that are allocated when the job runs | string | null | no |
| python_version | The Python version (2 or 3) being used to execute a Python shell job | string | 3 | no |
| role_arn | An optional Glue execution role | string | null | no |
| role_policy | A valid Glue IAM policy JSON document | string | null | no |
| schedule | A cron expression used to specify the schedule for the glue trigger | string | null | no |
| schedule_active | Whether the glue trigger should be active | bool | true | no |
| script_location | The S3 path to the script that is executed by the job | string | n/a | yes |
| trigger_type | The type ('ON_DEMAND' or 'SCHEDULED') of the trigger | string | null | no |
| worker_type | The type ('Standard' or 'G.1X' or 'G.2X') of predefined worker that is allocated when the job runs | string | null | no |
| tags | A mapping of tags to assign to all resources | map(string) | n/a | yes |

## Outputs

| Name | Description |
|------|---------|
| arn | The Glue job ARN |
| id | The Glue job name |
| trigger_arn | The Glue trigger ARN |
| trigger_id | The Glue trigger name |
