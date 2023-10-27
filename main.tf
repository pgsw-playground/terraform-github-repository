resource "github_repository" "this" {
  name       = var.github_name
  visibility = var.github_visibility

  template {
    owner                = var.github_template_owner
    repository           = var.github_template_repository
    include_all_branches = false
  }

  has_issues      = false
  has_discussions = false
  has_projects    = false
  has_wiki        = false

  allow_merge_commit = false
  allow_squash_merge = false
  allow_rebase_merge = true
  allow_auto_merge   = true
}

resource "github_branch" "this" {
  for_each = var.github_branches

  repository = github_repository.this.name
  branch     = each.key
}

resource "github_branch_default" "this"{
  repository = github_repository.this.name
  branch     = var.github_default_branch
}

resource "github_repository_environment" "this" {
  for_each = var.github_environments

  environment = each.key
  repository  = github_repository.this.name
}

resource "github_branch_protection" "this" {
  for_each = var.github_protected_branches

  repository_id = github_repository.this.name
  pattern       = each.key

  required_linear_history         = true
  require_conversation_resolution = true

  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    require_code_owner_reviews = true
  }
}