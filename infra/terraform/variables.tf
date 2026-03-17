variable "aws_region" {
  description = "Região da AWS."
  type        = string
  default     = "us-east-1"
}

variable "ec2_name" {
  description = "Nome da ec2."
  type        = string
  default     = "devops-challenge"
}

variable "ec2_instance_type" {
  description = "Tipo da instância EC2."
  type        = string
  default     = "t2.micro"
}

variable "ec2_ami" {
  description = "AMI da instância EC2."
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default = {
    projeto  = "devops-challenge"
    dono     = "dalonsw"
    ambiente = "dev"
  }
}