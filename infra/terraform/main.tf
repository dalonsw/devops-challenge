terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "default" {
  default = true
}

locals {
  effective_vpc_id = coalesce(var.vpc_id, data.aws_vpc.default.id)
}

resource "aws_security_group" "app_sg" {
  name        = var.ec2_security_group_name
  description = "Security Group para a instância EC2 do DevOps Challenge"
  vpc_id      = local.effective_vpc_id

  dynamic "ingress" {
    for_each = var.ec2_security_group_ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  tags = var.ec2_tags
}

resource "aws_instance" "app_instance" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  key_name      = var.ec2_key_name
  security_groups = [aws_security_group.app_sg.name]
  tags          = var.ec2_tags
}

