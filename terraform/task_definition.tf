resource "aws_ecs_task_definition" "main" {

  family                   = local.project_name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]


  cpu    = "256"
  memory = "512"

  execution_role_arn = aws_iam_role.ecstaskexecutionrole.arn
  task_role_arn      = aws_iam_role.ecstaskrole.arn

  container_definitions = jsonencode([
    {
      name      = local.project_name
      image     = aws_ecr_repository.taskmaster.repository_url
      essential = true

      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
          protocol      = "tcp"
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"

        options = {
          awslogs-group         = aws_cloudwatch_log_group.ecs.name
          awslogs-region        = var.aws_region
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}



