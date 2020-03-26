#resource "aws_instance" "webservers" {
#  count           = "${length(var.subnet_cidr)}"
#  ami             = "${var.webservers_ami}"
#  instance_type   = "${var.instance_type}"
#  security_groups = ["${aws_security_group.secgp-webservers.id}"]
#  subnet_id       = "${element(aws_subnet.public.*.id, count.index)}"
#  user_data       = "${file("install_httpd.sh")}"
#}