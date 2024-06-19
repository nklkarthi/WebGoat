module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

module "ecr" {
  source    = "./modules/ecr"
  repo_name = var.repo_name
}

module "iam" {
  source    = "./modules/iam"
  role_name = var.role_name
}

module "codepipeline" {
  source                = "./modules/codepipeline"
  build_project_name    = var.build_project_name
  service_role          = module.iam.role_arn
  bucket_name           = module.s3.bucket_name
  github_repository_url = var.github_repository_url
  pipeline_name         = var.pipeline_name
  github_owner          = var.github_owner
  github_repo           = var.github_repo
  github_branch         = var.github_branch
  github_token          = var.github_token
  ecs_cluster_name      = var.ecs_cluster_name
  ecs_service_name      = var.ecs_service_name
}
