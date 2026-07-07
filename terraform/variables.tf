variable "environment" {
  description = "deployment environment"
  type        = string
}
variable "aws_region" {
  description = "AWS Region where resources will be created"
  type        = string
}
variable "vpc_cidr" {
  description = "cidr block for the VPC"
  type        = string
}
variable "public_subnet_cidrs" {
  description = "cidrs of public subnet"
  type        = list(string)
}
variable "private_subnet_cidrs" {
  description = "cidrs of private subnet"
  type        = list(string)
}
variable "availability_zones" {
  description = "availabiity zones for the subnets"
  type        = list(string)

}