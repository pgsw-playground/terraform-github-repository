variable "github_name" {
  description = "The Name of GitHub repository"
  type        = string
}

variable "github_visibility" {
  default     = "private"
  description = "The visibility of repository"
  type        = string
}

variable "github_template_owner" {
  default     = "pgsw-playground"
  description = "The owner of repository template"
  type        = string
}

variable "github_template_repository" {
  default     = "terraform-github-devops-repository-template"
  description = "The repository template"
  type        = string
}

variable "github_branches" {
  default     = ["main", "develop", "release"]
  description = "The name of branches"
  type        = set(string)
}

variable "github_default_branch" {
  default     = "develop"
  description = "The name of default branch"
  type        = string
}

variable "github_environments" {
  default     = ["development", "staging", "production"]
  description = "The Name of environments"
  type        = set(string)
}

variable "github_protected_branches" {
  default     = ["main", "develop", "release"]
  description = "The name of protected branches"
  type        = set(string)
}