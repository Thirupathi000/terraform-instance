
provider "aws" {
  region = var.aws_region
}

# Automatically select default subnet
data "aws_subnets" "default" {
  filter {
    name   = "default-for-az"
    values = ["true"]
  }
}

resource "aws_instance" "project" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnets.default.ids[0]
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name    = var.instance_name
    Project = var.project_name
  }
}
