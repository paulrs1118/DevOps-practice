#create S3 VPC endpoint
resource "aws_vpc_endpoint" "S3_VPC_endpoint" {
  vpc_id       = aws_vpc.terraform-vpc.id
  service_name = "com.amazonaws.us-east-1.s3"

  route_table_ids = [aws_route_table.terraform-public-rt.id]

  policy = <<POLICY
{
    "Statement": [
        {
            "Action": "*",
            "Effect": "Allow",
            "Resource": "*",
            "Principal": "*"
        }
    ]
}
POLICY
}
