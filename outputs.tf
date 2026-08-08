output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS name"
  value       = aws_lb.main.dns_name
}

output "web_instance_1_id" {
  description = "First EC2 instance ID"
  value       = aws_instance.web_1.id
}

output "web_instance_2_id" {
  description = "Second EC2 instance ID"
  value       = aws_instance.web_2.id
}
