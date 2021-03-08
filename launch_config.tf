resource "aws_launch_configuration" "terraform_lc" {
  name_prefix     = "${var.domain}-launch-config_"
  image_id        = data.aws_ami.ubuntu20.id
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.terraform_keypair.key_name
  security_groups = [aws_security_group.tf-http-ssh-sg.id]

  user_data = file("${path.module}/user_data.txt")

  lifecycle {
    create_before_destroy = true
  }
}
