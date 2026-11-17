
provider "aws" {
  region = var.aws_region
}

# Automatically fetch available subnets
data "aws_subnets" "project" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

# Create EC2 instance
resource "aws_instance" "project" {
  ami                    = var.ami_id
  instance_type          = var.instance_type

  subnet_id              = data.aws_subnets.project.ids[0]

  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name    = var.instance_name
    Project = var.project_name
  }

  lifecycle {
    precondition {
      condition     = length(data.aws_subnets.project.ids) > 0
      error_message = "No subnet found in the configured VPC. Check the VPC ID and AWS region."
    }
  }
}
