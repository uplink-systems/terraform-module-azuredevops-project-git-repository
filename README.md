## Module 'terraform-module-azuredevops-project-git-repository'

### Description

The module <i>terraform-module-project-git-repository</i> manages Azure DevOps project Git repositories.  

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_azuredevops"></a> [microsoft\/azuredevops](#requirement\_azuredevops) | ~> 1.6 |

### Resources

| Name | Type |
|------|------|
| [azuredevops_git_repository.git_repository](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/git_repository) | resource |
| [azuredevops_repository_policy_author_email_pattern.author_email_pattern](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/repository_policy_author_email_pattern) | resource |
| [azuredevops_repository_policy_case_enforcement.case_enforcement](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/repository_policy_case_enforcement) | resource |
| [azuredevops_repository_policy_check_credentials.check_credentials](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/repository_policy_check_credentials) | resource |
| [azuredevops_repository_policy_file_path_pattern.file_path_pattern](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/repository_policy_file_path_pattern) | resource |
| [azuredevops_repository_policy_max_file_size.max_file_size](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/repository_policy_max_file_size) | resource |
| [azuredevops_repository_policy_max_path_length.max_path_length](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/repository_policy_max_path_length) | resource |
| [azuredevops_repository_policy_reserved_names.reserved_names](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/repository_policy_reserved_names) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_git_repository"></a> [git\_repository](#input\_git\_repository) | git_repository main variable with resource attributes | <pre>type        = object({<br>  name                  = string<br>  project_id            = string<br>  default_branch        = optional(string, "refs/heads/main")<br>  disabled              = optional(bool, false)<br>  initialization        = optional(object({<br>    init_type             = optional(string, "Clean")<br>    source_type           = optional(string, null)<br>    source_url            = optional(string, null)<br>    service_connection_id = optional(string, null)<br>  }), {})<br>  parent_repository_id  = optional(string, null)<br>})</pre> | none | yes |
| <a name="input_repository_policy"></a> [repository\_policy](#input\_repository\_policy) | repository_policy main variable with resource attributes for repository-level policies | <pre>type        = object({<br>  author_email_pattern  = optional(object({<br>    enabled                 = optional(bool, true)<br>    blocking                = optional(bool, true)<br>    author_email_patterns   = list(string)<br>  }), {<br>    enabled                 = false<br>    author_email_patterns   = ["\*@example.code"]<br>  })<br>  case_enforcment       = optional(object({<br>    enabled                 = optional(bool, true)<br>    blocking                = optional(bool, true)<br>    enforce_consistent_case = optional(bool, true)<br>  }), {<br>    enabled                 = false<br>    enforce_consistent_case = false<br>  })<br>  check_credentials     = optional(object({<br>    enabled                 = optional(bool, true)<br>    blocking                = optional(bool, true)<br>  }), { enabled = false })<br>  file_path_pattern     = optional(object({<br>    enabled                 = optional(bool, true)<br>    blocking                = optional(bool, true)<br>    file_path_patterns      = list(string)<br>  }), {<br>    enabled                 = false<br>    file_path_patterns      = ["example.code","/code/\*.example"]<br>  })<br>  max_file_size         = optional(object({<br>    enabled                 = optional(bool, true)<br>    blocking                = optional(bool, true)<br>    max_file_size           = optional(number, 10)<br>  }), { enabled = false })<br>  max_path_length       = optional(object({<br>    enabled                 = optional(bool, true)<br>    blocking                = optional(bool, true)<br>    max_path_length         = optional(number, 1000)<br>  }), { enabled = false })<br>  reserved_names        = optional(object({<br>    enabled                 = optional(bool, true)<br>    blocking                = optional(bool, true)<br>  }), { enabled = false })<br>})<br></pre> | none | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_git_repository"></a> [git\_repository](#output\_git\_repository) | list of all exported attributes values from the git_repository resource |
| <a name="output_repository_policy_author_email_pattern"></a> [repository\_policy\_author\_email\_pattern](#output\_repository\_policy\_author\_email\_pattern) | list of all exported attributes values from the repository_policy_author_email_pattern resource |
| <a name="output_repository_policy_case_enforcement"></a> [repository\_policy\_case\_enforcement](#output\_repository\_policy\_case\_enforcement) | list of all exported attributes values from the repository_policy_case_enforcement resource |
| <a name="output_repository_policy_file_path_pattern"></a> [repository\_policy\_file\_path\_pattern](#output\_repository\_policy\_file\_path\_pattern) | list of all exported attributes values from the repository_policy_file_path_pattern resource |
| <a name="output_repository_policy_max_file_size"></a> [repository\_policy\_max\_file\_size](#output\_repository\_policy\_max\_file\_size) | list of all exported attributes values from the repository_policy_max_file_size resource |
| <a name="output_repository_policy_max_path_length"></a> [repository\_policy\_max\_path\_length](#output\_repository\_policy\_max\_path\_length) | list of all exported attributes values from the repository_policy_max_path_length resource |
| <a name="output_repository_policy_reserved_names"></a> [repository\_policy\_reserved\_names](#output\_repository\_policy\_reserved\_names) | list of all exported attributes values from the repository_policy_reserved_names resource |

### Known Issues

Known issues are documented with the GitHub repo's issues functionality. Please filter the issues by **Types** and select **Known Issue** to get the appropriate issues and read the results carefully before using the module to avoid negative impacts on your infrastructure.  
  
<a name="known_issues"></a> [list of Known Issues](https://github.com/uplink-systems/terraform-module-azuredevops-project-git-repository/issues?q=type%3A%22known%20issue%22)
