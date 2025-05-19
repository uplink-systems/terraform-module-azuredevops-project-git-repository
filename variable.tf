####################################################################################################
#   variable.tf                                                                                    #
####################################################################################################

variable "git_repository" {
  description = "parameter for Git repository"
  type        = object({
    name                  = string
    project_id            = string
    default_branch        = optional(string, "refs/heads/main")
    disabled              = optional(bool, false)
    initialization        = optional(object({
      init_type             = optional(string, "Clean")
      source_type           = optional(string, null)
      source_url            = optional(string, null)
      service_connection_id = optional(string, null)
    }), {})
    parent_repository_id  = optional(string, null)
  })
  validation {
    condition     = var.git_repository.initialization.init_type == null ? true : contains(["Clean", "Import", "Uninitialized"], var.git_repository.initialization.init_type)
    error_message = <<-EOF
      Variable attribute 'initialization.init_type' has an invalid value.
      Value must be one of:
        "Clean", "Import", "Uninitialized"
    EOF
  }
}

variable "repository_policy" {
  description = "Repository policy attributes for repository-level policies"
  type        = object({
    author_email_pattern  = optional(object({
      enabled                 = optional(bool, true)
      blocking                = optional(bool, true)
      author_email_patterns   = list(string)
    }), {
      enabled                 = false
      author_email_patterns   = ["*@example.code"]
    })
    case_enforcment       = optional(object({
      enabled                 = optional(bool, true)
      blocking                = optional(bool, true)
      enforce_consistent_case = optional(bool, true)
    }), {
      enabled                 = false
      enforce_consistent_case = false
    })
    file_path_pattern     = optional(object({
      enabled                 = optional(bool, true)
      blocking                = optional(bool, true)
      file_path_patterns      = list(string)
    }), {
      enabled                 = false
      file_path_patterns      = ["example.code","/code/*.example"]
    })
    max_file_size         = optional(object({
      enabled                 = optional(bool, true)
      blocking                = optional(bool, true)
      max_file_size           = optional(number, 10)
    }), { enabled = false })
    max_path_length       = optional(object({
      enabled                 = optional(bool, true)
      blocking                = optional(bool, true)
      max_path_length         = optional(number, 1000)
    }), { enabled = false })
    reserved_names        = optional(object({
      enabled                 = optional(bool, true)
      blocking                = optional(bool, true)
    }), { enabled = false })
  })
}