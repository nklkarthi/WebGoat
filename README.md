# WebGoat: A deliberately insecure Web Application

*Terraform configurations*

    For building the AWS Resouces are present in terraform-aws folder
    Terraform configuration files are structured as modules for each related resource and the root module
    
    main.tf
    variables.tf
    outputs.tf

*Uses Terraform Cloud as backend*

        To store the state for Team work
        To store the runs for Team work

*Pre-requisties*
    
    All the required Terraform variables and Environment variables should be created in Terraform Cloud

*Github actions*

      Terraform workflow are invoked by the Github Actions


*Infrastructure provisiong*
        
        Terraform resouces for s3, iam, ecr, codebuild, codepipeline using AWS provider.

*Open Source Security Tools used*

      Semgerp for SAST 
      OWASP Dependency check for scan the vulnerabilities in dependencies
      git-leaks for password scanning
      Trivy for scanning the container image built.


    
