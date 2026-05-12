output "instance_id" {
  description = "Expose instance"
  value       = aws_instance.main1.id
}

output "public_ip" {
  description = "Expose public ip"
  value       = aws_instance.main1.public_ip
}
