resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"


  tags = {
    Name = "${local.project_name}-${var.environment}-vpc"
  }


}