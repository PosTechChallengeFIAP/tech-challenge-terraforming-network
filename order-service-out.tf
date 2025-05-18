output "order_api_public_subnet_a_id" {
  value = aws_subnet.orderApi.id
}

output "order_api_public_subnet_b_id" {
  value = aws_subnet.orderApi2.id
}

output "order_api_sg_id" {
  value = aws_security_group.orderApi.id
}