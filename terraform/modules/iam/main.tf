resource "aws_iam_role" "main" {
  name = "${var.project_name}-${var.environment}-role" 
  assume_role_policy = jsonencode({
  Version = "2012-10-17"
  Statement = [{
    Action    = "sts:AssumeRole"
    Effect    = "Allow"
    Principal = { Service = "ec2.amazonaws.com" }
  }]
})
  tags = {
    Name        = "${var.project_name}-${var.environment}-IAM-role"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_iam_role_policy" "main" {
  name = "${var.project_name}-${var.environment}-policy"
  role = aws_iam_role.main.id
  policy = jsonencode({
  Version = "2012-10-17",
  Statement = [{
    Action = ["s3:GetObject","s3:ListBucket"]
    Effect = "Allow",
    Resource = var.bucket_arn
  }]
})
}

resource "aws_iam_instance_profile" "main" {
  name = "${var.project_name}-${var.environment}-instance_profile"
  role = aws_iam_role.main.id
}
