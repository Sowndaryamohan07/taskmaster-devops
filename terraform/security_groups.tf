resource "aws_security_group" "alb-sg" {
  vpc_id      = aws_vpc.main.id
  name        = "${local.project_name}-${var.environment}-alb-sg"
  description = "Security Group for Application Load Balancer"

  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }



  tags = {
    Name        = "${local.project_name}-${var.environment}-alb-sg"
    description = "Security Group for Application Load Balancer"
  }


}

resource "aws_security_group" "ecs-sg" {
  vpc_id      = aws_vpc.main.id
  name        = "${local.project_name}-${var.environment}-ecs-sg"
  description = "Security Group For ECS Service"

  ingress {
    description = "Allow Traffic from ECS"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outboud traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.project_name}-${var.environment}-ecs-sg"
  }

}