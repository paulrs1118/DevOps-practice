resource "aws_elb" "terraform-elb" {
  name            = "terraform-elb"
  subnets         = [aws_subnet.terraform_subnet.id]
  security_groups = [aws_security_group.tf-http-ssh-sg.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 5
    timeout             = 15
    target              = "HTTP:80/"
    interval            = 30
  }

  tags = {
    Name = "${var.domain}-elb"
  }
}
