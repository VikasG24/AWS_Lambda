resource "aws_autoscaling_group" "autoscaling-group-app" {
  name                      = "autoscaling-group-app"
  max_size                  = 2
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true
  default_cooldown = 300

  load_balancers = ["${aws_elb.app-elb.name}"]
 #placement_group           = "${aws_placement_group.test.id}"
 #launch_configuration      = "${aws_launch_configuration.foobar.name}"
 #count = "${length(var.subnet_cidr)}"

  vpc_zone_identifier       = "${aws_subnet.public.*.id}"
#availability_zones = "${element(var.avlzone,count.index)}"
launch_configuration = "${aws_launch_configuration.ec2-config.name}"
#vpc_id = "${aws_vpc.app_vpc.id}"

 }

resource "aws_launch_configuration" "ec2-config" {
  name_prefix   = "ec2-config"
  image_id      = "${var.webservers_ami}"
  instance_type = "${var.instance_type}"
  security_groups = ["${aws_security_group.secgp-webservers.id}"]
associate_public_ip_address = true
#vpc_id = "${aws_vpc.app_vpc.id}"
user_data       = "${file("install_httpd.sh")}"
}

#Defining ASG Policy

resource "aws_cloudwatch_metric_alarm" "avg_cpu_ge_80" {
  alarm_name          = "avg_cpu_ge_80"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
}