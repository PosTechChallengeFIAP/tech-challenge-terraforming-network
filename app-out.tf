output "main_public_subnet_a_id" {
  value = aws_subnet.app_subnet_1.id
}

output "main_public_subnet_b_id" {
  value = aws_subnet.app_subnet_2.id
}

output "main_sg_id" {
  value = aws_security_group.app.id
}