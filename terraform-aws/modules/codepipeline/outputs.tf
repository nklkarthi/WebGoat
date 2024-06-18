output "pipeline_name" {
  value = aws_codepipeline.webgoat_pipeline
}

output "build_project_name" {
  value = aws_codebuild_project.webgoat_build.name
}
