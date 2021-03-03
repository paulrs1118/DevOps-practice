resource "aws_instance" "terraform-ubuntu-instance" {
  count                       = 2
  ami                         = "ami-03d315ad33b9d49c4"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.terraform_keypair.key_name
  vpc_security_group_ids      = [aws_security_group.terraform-ssh-http-sg.id]
  subnet_id                   = aws_subnet.terraform_subnet.id
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.SSM_EC2_profile.name

  tags = {
    Name = "terraform-Ubuntu"
  }
}
