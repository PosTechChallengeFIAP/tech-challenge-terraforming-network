output "docdb_sg_id" {
  description = "ID do security group do DocumentDB"
  value       = aws_security_group.docdb_sg.id
}

output "docdb_subnet_group_name" {
  description = "DocumentDB subnet group name"
  value = aws_db_subnet_group.docdb_subnet_group.name
}