output "bucket_name" {
  value = module.s3.bucket_name
}

output "repository_url" {
  value = module.ecr.repository_url
}

output "role_arn" {
  value = module.iam.role_arn
}

output "build_project_name" {
  value = module.codepipeline.build_project_name
}
