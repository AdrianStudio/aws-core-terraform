output "instance_profile_name" {
  description = "Expose profile name"
  value       = aws_iam_instance_profile.main.name
}

output "role_arn" {
  description = "Expose ARN role"
  value       = aws_iam_role.main.arn
}
