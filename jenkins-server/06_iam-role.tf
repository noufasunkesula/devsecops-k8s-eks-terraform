# IAM Role for EC2 to assume
resource "aws_iam_role" "k8s_noufa_iam_role" {
  name               = var.iam_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# IAM Policy to allow EC2 access to ECR
resource "aws_iam_policy" "k8s_noufa_ecr_access_policy" {
  name        = "k8s_noufa_ECRAccessPolicy"
  description = "Policy to allow EC2 to access ECR"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetRepositoryPolicy",
        "ecr:ListImages",
        "ecr:BatchGetImage",
        "ecr:InitiateLayerUpload",
        "ecr:UploadLayerPart",
        "ecr:CompleteLayerUpload",
        "ecr:PutImage"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

# Attach ECR policy to IAM role
resource "aws_iam_role_policy_attachment" "k8s_noufa_ecr_policy_attachment" {
  policy_arn = aws_iam_policy.k8s_noufa_ecr_access_policy.arn
  role       = aws_iam_role.k8s_noufa_iam_role.name
}
