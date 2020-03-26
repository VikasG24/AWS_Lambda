provider "aws"{
region = "${var.aws_region}"
}
resource "aws_key_pair" "ec2-webserver" {
  key_name   = "ec2-webserver"
  public_key="${var.ec2-webserver}"
}