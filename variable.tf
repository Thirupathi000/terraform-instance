
variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-0055977a6e828a4f4"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_name" {
  default = "Redhat-9-DevOps-Practice"
}

variable "project_name" {
  default = "DevOps-Practice"
}

variable "vpc_id" {
  default = "vpc-0a69064a27152e40"
}

variable "security_group_id" {
  default = "sg-071ddf420adfadca0"
}

variable "subnet_id" {
  description = "Existing subnet ID"
  type        = string
}