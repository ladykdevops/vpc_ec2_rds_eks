resource "aws_iam_role" "rdssql_iam_role" {
  name                = "rdssql_iam_role"
  path                = "/"
  managed_policy_arns = var.ManagedPolicy
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Sid    = ""
        Effect = "Allow"
        Principal = {
          Service = "rds.amazonaws.com"
        }
      },
    ]
  })
}