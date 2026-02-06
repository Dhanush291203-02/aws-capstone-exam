output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "web_instance_public_ips" {
  value = aws_instance.web[*].public_ip
}

output "alb_dns_name" {
  value = aws_lb.web.dns_name
}

output "rds_endpoint" {
  value = aws_db_instance.mysql.address
}
