output "payment_api_public_subnet_a_id" {
  value = aws_subnet.paymentApi.id
}

output "payment_api_public_subnet_b_id" {
  value = aws_subnet.paymentApi2.id
}

output "payment_api_sg_id" {
  value = aws_security_group.paymentApi.id
}