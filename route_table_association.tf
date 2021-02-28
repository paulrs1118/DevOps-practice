resource "aws_route_table_association" "terraform_public_assoc" {
  subnet_id      = aws_subnet.terraform_subnet.id
  route_table_id = aws_route_table.terraform-public-rt.id
}
