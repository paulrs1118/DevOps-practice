output "instance1_public_ip" {
  value = aws_instance.terraform-ubuntu-instance.public_ip
}
output "instance2_public_ip"{
 value =aws_instance.terraform-ubuntu-instance2.public_ip
}
