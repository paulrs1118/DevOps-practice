resource "aws_instance" "terraform-ubuntu-instance" {
  ami                         = "ami-03d315ad33b9d49c4"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.terraform_keypair.key_name
  vpc_security_group_ids      = [aws_security_group.terraform-allow-ssh-sg.id]
  subnet_id                   = aws_subnet.terraform_subnet.id
  associate_public_ip_address = true

  tags = {
    Name = "terraform-Ubuntu"
  }
}

resource "aws_instance" "terraform-ubuntu-instance2" {
  ami                         = "ami-03d315ad33b9d49c4"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.terraform_keypair.key_name
  vpc_security_group_ids      = [aws_security_group.terraform-allow-ssh-sg.id]
  subnet_id                   = aws_subnet.terraform_subnet.id
  associate_public_ip_address = true

  tags = {
    Name = "terraform-Ubuntu2"
  }
}
