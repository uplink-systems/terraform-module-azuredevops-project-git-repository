####################################################################################################
#   main.tf                                                                                        #
####################################################################################################

resource "azuredevops_git_repository" "git_repository" {
  name                  = var.git_repository.name
  project_id            = var.git_repository.project_id
  default_branch        = var.git_repository.default_branch
  disabled              = var.git_repository.disabled
  initialization {
    init_type             = var.git_repository.initialization.init_type
    source_type           = var.git_repository.initialization.source_type
    source_url            = var.git_repository.initialization.source_url
    service_connection_id = var.git_repository.initialization.service_connection_id
  }
  parent_repository_id  = var.git_repository.parent_repository_id
  lifecycle {
    ignore_changes = [ initialization ]
  }
}

resource "azuredevops_repository_policy_author_email_pattern" "author_email_pattern" {
  project_id              = var.git_repository.project_id
  repository_ids          = [ azuredevops_git_repository.git_repository.id ]
  enabled                 = var.repository_policy.author_email_pattern.enabled
  blocking                = var.repository_policy.author_email_pattern.blocking
  author_email_patterns   = var.repository_policy.author_email_pattern.author_email_patterns
  depends_on              = [ azuredevops_git_repository.git_repository ]
}

resource "azuredevops_repository_policy_case_enforcement" "case_enforcement" {
  project_id              = var.git_repository.project_id
  repository_ids          = [ azuredevops_git_repository.git_repository.id ]
  enabled                 = var.repository_policy.case_enforcment.enabled
  blocking                = var.repository_policy.case_enforcment.blocking
  enforce_consistent_case = var.repository_policy.case_enforcment.enforce_consistent_case
  depends_on              = [ azuredevops_git_repository.git_repository ]
}

resource "azuredevops_repository_policy_file_path_pattern" "file_path_pattern" {
  project_id              = var.git_repository.project_id
  repository_ids          = [ azuredevops_git_repository.git_repository.id ]
  enabled                 = var.repository_policy.file_path_pattern.enabled
  blocking                = var.repository_policy.file_path_pattern.blocking
  filepath_patterns       = var.repository_policy.file_path_pattern.file_path_patterns
  depends_on              = [ azuredevops_git_repository.git_repository ]
}

resource "azuredevops_repository_policy_max_file_size" "max_file_size" {
  project_id              = var.git_repository.project_id
  repository_ids          = [ azuredevops_git_repository.git_repository.id ]
  enabled                 = var.repository_policy.max_file_size.enabled
  blocking                = var.repository_policy.max_file_size.blocking
  max_file_size           = var.repository_policy.max_file_size.max_file_size
  depends_on              = [ azuredevops_git_repository.git_repository ]
}

resource "azuredevops_repository_policy_max_path_length" "max_path_length" {
  project_id              = var.git_repository.project_id
  repository_ids          = [ azuredevops_git_repository.git_repository.id ]
  enabled                 = var.repository_policy.max_path_length.enabled
  blocking                = var.repository_policy.max_path_length.blocking
  max_path_length         = var.repository_policy.max_path_length.max_path_length
  depends_on              = [ azuredevops_git_repository.git_repository ]
}

resource "azuredevops_repository_policy_reserved_names" "reserved_names" {
  project_id              = var.git_repository.project_id
  repository_ids          = [ azuredevops_git_repository.git_repository.id ]
  enabled                 = var.repository_policy.reserved_names.enabled
  blocking                = var.repository_policy.reserved_names.blocking
  depends_on              = [ azuredevops_git_repository.git_repository ]
}
