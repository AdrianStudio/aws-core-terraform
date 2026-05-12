output "vpc_id" {
  description = "expose VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_1_id" {
  description = "expose public subnet 1"
  value       = aws_subnet.public1.id
}

output "public_subnet_2_id" {
  description = "expose public subnet 2"
  value       = aws_subnet.public2.id
}

output "private_subnet_1_id" {
  description = "expose private subnet 1"
  value       = aws_subnet.private1.id
}

output "private_subnet_2_id" {
  description = "expose private subnet 2"
  value       = aws_subnet.private2.id
}
