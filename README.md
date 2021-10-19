# terraform-aws-glue-job

Terraform module to create and manage a AWS Glue job

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | >= 3.10 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.10 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The name of the Glue job | `string` | n/a | yes |
| script\_location | The S3 path to the script that is executed by the job | `string` | n/a | yes |
| tags | A mapping of tags to assign to all resources | `map(string)` | n/a | yes |
| command\_name | The name of the job command. Defaults to glueetl | `string` | `"glueetl"` | no |
| connections | A list with connections for this job | `list(string)` | `[]` | no |
| default\_arguments | A map with default arguments for the job | `map(string)` | `{}` | no |
| glue\_version | The Glue version to use | `string` | `"2.0"` | no |
| max\_capacity | The maximum number of data processing units that can be allocated | `number` | `null` | no |
| max\_retries | The maximum number of times to retry the failing job | `number` | `0` | no |
| number\_of\_workers | The number of workers that are allocated when the job runs | `string` | `null` | no |
| python\_version | The Python version (2 or 3) being used to execute a Python shell job | `string` | `"3"` | no |
| role\_arn | An optional Glue execution role | `string` | `null` | no |
| role\_policy | A valid Glue IAM policy JSON document | `string` | `null` | no |
| schedule | A cron expression used to specify the schedule for the glue trigger | `string` | `null` | no |
| schedule\_active | Whether the glue trigger should be active | `bool` | `true` | no |
| trigger\_type | The type ('ON\_DEMAND' or 'SCHEDULED') of the trigger | `string` | `null` | no |
| worker\_type | The type ('Standard' or 'G.1X' or 'G.2X') of predefined worker that is allocated when the job runs | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The Glue job ARN |
| id | The Glue job name |
| trigger\_arn | The Glue trigger ARN |
| trigger\_id | The Glue trigger name |

<!--- END_TF_DOCS --->
