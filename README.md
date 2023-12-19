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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.62.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.62.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_glue_job.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_job) | resource |
| [aws_glue_trigger.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_trigger) | resource |
| [aws_iam_role.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of the Glue job | `string` | n/a | yes |
| <a name="input_script_location"></a> [script\_location](#input\_script\_location) | The S3 path to the script that is executed by the job | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources | `map(string)` | n/a | yes |
| <a name="input_command_name"></a> [command\_name](#input\_command\_name) | The name of the job command. Defaults to glueetl | `string` | `"glueetl"` | no |
| <a name="input_connections"></a> [connections](#input\_connections) | A list with connections for this job | `list(string)` | `[]` | no |
| <a name="input_default_arguments"></a> [default\_arguments](#input\_default\_arguments) | A map with default arguments for the job | `map(string)` | `{}` | no |
| <a name="input_glue_version"></a> [glue\_version](#input\_glue\_version) | The Glue version to use | `string` | `"4.0"` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The kms key id of the AWS KMS Customer Managed Key to be used to encrypt the log data | `string` | `null` | no |
| <a name="input_log_retention_days"></a> [log\_retention\_days](#input\_log\_retention\_days) | The cloudwatch log group retention in days | `number` | `365` | no |
| <a name="input_max_capacity"></a> [max\_capacity](#input\_max\_capacity) | The maximum number of data processing units that can be allocated | `number` | `null` | no |
| <a name="input_max_retries"></a> [max\_retries](#input\_max\_retries) | The maximum number of times to retry the failing job | `number` | `0` | no |
| <a name="input_number_of_workers"></a> [number\_of\_workers](#input\_number\_of\_workers) | The number of workers that are allocated when the job runs | `string` | `null` | no |
| <a name="input_python_version"></a> [python\_version](#input\_python\_version) | The Python version (2 or 3) being used to execute a Python shell job | `string` | `"3"` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | An optional Glue execution role | `string` | `null` | no |
| <a name="input_role_policy"></a> [role\_policy](#input\_role\_policy) | A valid Glue IAM policy JSON document | `string` | `null` | no |
| <a name="input_schedule"></a> [schedule](#input\_schedule) | A cron expression used to specify the schedule for the glue trigger | `string` | `null` | no |
| <a name="input_schedule_active"></a> [schedule\_active](#input\_schedule\_active) | Whether the glue trigger should be active | `bool` | `true` | no |
| <a name="input_security_configuration"></a> [security\_configuration](#input\_security\_configuration) | The name of the Security Configuration to be associated with the job | `string` | `null` | no |
| <a name="input_trigger_type"></a> [trigger\_type](#input\_trigger\_type) | The type ('ON\_DEMAND' or 'SCHEDULED') of the trigger | `string` | `null` | no |
| <a name="input_worker_type"></a> [worker\_type](#input\_worker\_type) | The type ('Standard' or 'G.1X' or 'G.2X') of predefined worker that is allocated when the job runs | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The Glue job ARN |
| <a name="output_id"></a> [id](#output\_id) | The Glue job name |
| <a name="output_trigger_arn"></a> [trigger\_arn](#output\_trigger\_arn) | The Glue trigger ARN |
| <a name="output_trigger_id"></a> [trigger\_id](#output\_trigger\_id) | The Glue trigger name |
<!-- END_TF_DOCS -->