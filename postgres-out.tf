output "postgres_sg_id" {
  description = "ID do security group do Postgres"
  value       = aws_security_group.postgres_sg.id
}

output "postgres_subnet_group_name" {
  description = "Postgres subnet group name"
  value = aws_db_subnet_group.postgres_subnet_group.name
}