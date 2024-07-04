resource "aws_codebuild_project" "webgoat_build" {
  name         = var.build_project_name
  service_role = var.service_role
  artifacts {
    type     = "S3"
    location = var.bucket_name
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:4.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true
  }

  source {
    type     = "GITHUB"
    location = var.github_repository_url
  }

  build_timeout = 60
}

resource "aws_codestarconnections_connection" "github" {
    name          = "github-connection"
    provider_type = "GitHub"
}

resource "aws_codepipeline" "webgoat_pipeline" {
  name = var.pipeline_name

  artifact_store {
    type     = "S3"
    location = var.bucket_name
  }

  role_arn = var.service_role

  stage {
    name = "Source"

    action {
      name     = "Source"
      category = "Source"
      owner    = "ThirdParty"
      provider = "GitHub"
      version  = "1"

        configuration = {
            ConnectionArn    = aws_codestarconnections_connection.github.arn
            FullRepositoryId = "${var.github_owner}/${var.github_repo}"
            BranchName       = var.github_branch
        }

      output_artifacts = ["source_output"]
    }
  }

  stage {
    name = "Build"

    action {
      name     = "Build"
      category = "Build"
      owner    = "AWS"
      provider = "CodeBuild"
      version  = "1"

      configuration = {
        ProjectName = aws_codebuild_project.webgoat_build.name
      }

      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
    }
  }

  stage {
    name = "Deploy"

    action {
      name     = "Deploy"
      category = "Deploy"
      owner    = "AWS"
      provider = "ECS"
      version  = "2"

      configuration = {
        ClusterName = var.ecs_cluster_name
        ServiceName = var.ecs_service_name
        FileName    = "imagedefinitions.json"
      }

      input_artifacts = ["build_output"]
    }
  }
}
