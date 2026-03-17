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

variable "ec2_key_name" {
  description = "Nome da chave SSH para acessar a instância EC2."
  type        = string
  default     = "devops-challenge-key"
}

variable "ec2_security_group_name" {
  description = "Nome do Security Group para a instância EC2."
  type        = string
  default     = "devops-challenge-sg"
}


variable "ec2_security_group_ingress" {
  description = "Regras de ingresso para o Security Group da instância EC2."
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "vpc_id" {
  description = "ID do VPC onde a instância EC2 será criada."
  type        = string
  default     = null # Se null, usa o VPC padrão
}

variable "ec2_tags" {
  description = "Tags"
  type        = map(string)
  default = {
    Name     = "devops-challenge"
    projeto  = "devops-challenge"
    dono     = "dalonsw"
    ambiente = "dev"
  }
}