#-----This file allow EC2 instances to connect S3 bucket-----
#First we need to create a profile for S3, this profile will be attached to instance
resource "aws_iam_instance_profile" "S3_EC2_profile" {
  name = "S3_EC2_profile"
  role = aws_iam_role.S3_EC2_role.name
}

#Then we need a S3 role, this role will be attached to profile above
resource "aws_iam_role" "S3_EC2_role" {
  name = "S3_EC2_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

#Finally we need a S3 policy, this policy will be attached to role above
resource "aws_iam_role_policy" "S3_EC2_policy" {
  name = "S3_EC2_policy"
  role = aws_iam_role.S3_EC2_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "s3:*"
        Resource = "*"
      }
    ]
  })
}
