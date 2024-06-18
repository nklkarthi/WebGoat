variable "build_project_name" {
  description = "Name of the CodeBuild project"
  type        = string
}

variable "service_role" {
  description = "IAM role for CodeBuild and CodePipeline"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket for storing build artifacts"
  type        = string
}

variable "github_repository_url" {
  description = "GitHub repository URL"
  type        = string
}

variable "pipeline_name" {
  description = "Name of the CodePipeline"
  type        = string
}

variable "github_owner" {
  description = "GitHub owner"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}

variable "github_branch" {
  description = "GitHub branch"
  type        = string
}

variable "github_token" {
  description = "GitHub OAuth token"
  type        = string
}

variable "ecs_cluster_name" {
  description = "ECS cluster name"
  type        = string
}

variable "ecs_service_name" {
  description = "ECS service name"
  type        = string
}
