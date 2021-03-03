output "instance_public_ip" {
  value = aws_instance.terraform-ubuntu-instance.*.public_ip
}
