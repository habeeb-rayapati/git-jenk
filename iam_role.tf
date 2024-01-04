resource "aws_iam_role" "my-s3-jenkins-role-week20" {
  name = "s3-jenkins_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com" #service level Access
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "s3-jenkins-policy-week20" {
  name   = "s3-jenkins-rw-policy"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "S3ReadWriteAccess",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::jenkins-s3-bucket-week20terraformmmmm",
        "arn:aws:s3:::jenkins-s3-bucket-week20terraformmmmm/*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "s3-jenkins-access" {
  policy_arn = aws_iam_policy.s3-jenkins-policy-week20.arn
  role       = aws_iam_role.my-s3-jenkins-role-week20.name
}

resource "aws_iam_instance_profile" "s3-jenkins-profile-week20" {
  name = "s3-jenkins-profile"
  role = aws_iam_role.my-s3-jenkins-role-week20.name
}