resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/ecs/${local.project_name}"
  retention_in_days = 7

  tags = {
    Name = "${local.project_name}-logs"
  }

}