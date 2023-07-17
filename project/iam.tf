# built-in for_each function, meta-argument accepts a map or a set of strings, return each.key, unlike use count
resource "aws_iam_user" "iam" {
  for_each = toset(var.iam_user_list)
  name     = each.key
  path     = "/system/"
}

# define which policies are allowed to the users just created
resource "aws_iam_user_policy" "iam_policy" {
  count = length(var.iam_user_list)
  name  = "Prod"
  user  = element(var.iam_user_list, count.index)

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:StartInstances",
          "iam:ChangePassword",
          "s3:GetObject"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}