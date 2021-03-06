variable "aws_region" {
  default = "us-east-1"
}
variable "vpc_cidr" {
  default = "10.20.0.0/16"
}

variable "subnet_cidr" {
  type    = "list"
  default = ["10.20.1.0/24", "10.20.2.0/24"]
}
variable "avlzone" {
  type    = "list"
  default = ["us-east-1a", "us-east-1b"]
}
variable "webservers_ami" {
  default = "ami-062f7200baf2fa504"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ec2-webserver"{
default = "/home/ec2-user/.ssh/id_rsa.pub"
}