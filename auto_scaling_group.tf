resource "aws_autoscaling_group" "asg" {
  name                      = "${var.domain}-terraform_asg"
  max_size                  = 4
  min_size                  = 0
  desired_capacity          = 2
  health_check_type         = "ELB"
  health_check_grace_period = 10

  launch_configuration = aws_launch_configuration.terraform_lc.name
  vpc_zone_identifier  = [aws_subnet.terraform_subnet.id]
  load_balancers       = [aws_elb.terraform-elb.name]

  tag {
    key                 = "Name"
    value               = "${var.domain}-terraform_asg_instance"
    propagate_at_launch = true
  }
}
