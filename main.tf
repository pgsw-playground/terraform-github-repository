resource "github_repository" "example" {
  name        = "pgsw-tfc-demo"
  description = "Demo"

  visibility = "public"

  template {
    owner                = "pgsw-pogosoftware"
    repository           = "terraform-github-devops-repository-template"
    include_all_branches = false
  }
}
