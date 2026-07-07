resource "aws_ecr_repository" "taskmaster" {
    name = local.project_name
    image_tag_mutability = "MUTABLE"
    image_scanning_configuration {
      scan_on_push = true
    }
    tags = {
      Name = local.project_name
      description = "Name of the ECR Repository"
    }
  
}