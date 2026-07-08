data "aws_iam_policy_document" "ecs-task-execution-assume-role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }

}

resource "aws_iam_role" "ecstaskexecutionrole" {
  name        = "${local.project_name}-${var.environment}-ecs-taskexecution-role"
  description = "IAM Role for ECS Service to access ECR"

  assume_role_policy = data.aws_iam_policy_document.ecs-task-execution-assume-role.json

  tags = {
    Name = "${local.project_name}-${var.environment}-ecs-taskexecution-role"
  }



}

resource "aws_iam_role_policy_attachment" "ecstaskexecutionpolicy" {
  role       = aws_iam_role.ecstaskexecutionrole.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

data "aws_iam_policy_document" "ecs-task-assume-role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }

}

resource "aws_iam_role" "ecstaskrole" {
  name = "${local.project_name}-${var.environment}-ecs-task-role"

  assume_role_policy = data.aws_iam_policy_document.ecs-task-assume-role.json

  tags = {
    Name = "${local.project_name}-${var.environment}-ecs-task-role"
  }

}