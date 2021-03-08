resource "aws_subnet" "terraform_subnet" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = var.cidr_block1
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "terraform-subnet"
  }
}
