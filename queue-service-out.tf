output "queue_api_public_subnet_a_id" {
  value = aws_subnet.queueApi.id
}

output "queue_api_public_subnet_b_id" {
  value = aws_subnet.queueApi2.id
}

output "queue_api_sg_id" {
  value = aws_security_group.queueApi.id
}