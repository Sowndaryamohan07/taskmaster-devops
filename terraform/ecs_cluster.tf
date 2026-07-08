resource "aws_ecs_cluster" "main" {
  name = "${local.project_name}-cluster"

  tags = {
    Name = "${local.project_name}-cluster"
  }

}