output "postgres_sg_id" {
  description = "ID do security group do Postgres"
  value       = aws_security_group.postgres_sg.id
}