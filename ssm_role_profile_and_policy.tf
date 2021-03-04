resource "aws_iam_instance_profile" "SSM_EC2_profile" {
  name = "SSM_EC2_profile"
  role = aws_iam_role.SSM_EC2_role.name
}

resource "aws_iam_role" "SSM_EC2_role" {
  name = "SSM_EC2_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "EC2-ssm-policy" {
  role       = aws_iam_role.SSM_EC2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
