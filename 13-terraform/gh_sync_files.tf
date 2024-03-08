resource "github_repository_file" "gh_sync" {
  for_each = {
    file1 = "config.tf",
    file2 = "gh_sync_files.tf",
    file3 = "prod.auto.tfvars",
    file4 = "vars.tf",
    file5 = "wcg-deployment.tf",
    file6 = "wcg-ingress.tf",
    file7 = "wcg-service.tf"
  }

  repository          = "devops-hometasks"
  file                = "13-terraform/${each.value}"
  content             = file("${each.value}")
  branch              = "main"
  overwrite_on_create = true
  commit_message      = "Managed by Terraform"

}
