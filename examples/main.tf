####################################################################################################
#   main.tf                                                                                        #
####################################################################################################

module "repository_minimum-conf-repo" {
  source                      = "github.com/uplink-systems/terraform-module-azuredevops-project-git-repository"
  git_repository              = {
    name                        = "minimum-conf-repo"
    project_id                  = azuredevops_project.example.project_id
  }
  repository_policy             = {
    file_path_pattern               = {
      file_path_patterns                = [ "*.cmd","block.me" ]
    }
    max_file_size                   = {
      max_file_size                     = 20
    }
  }
}

module "repository_import-repo" {
  source                      = "github.com/uplink-systems/terraform-module-azuredevops-project-git-repository"
  git_repository              = {
    name                        = "import-repo"
    project_id                  = azuredevops_project.example.project_id
    disabled                    = true
    initialization              = {
      init_type                   = "Import"
      source_type                 = "Git"
      source_url                  = "https://github.com/any-account/other-repo.git"
    }
  }
}
