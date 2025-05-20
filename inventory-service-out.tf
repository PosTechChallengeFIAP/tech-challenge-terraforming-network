output "inventory_api_public_subnet_a_id" {
  value = aws_subnet.inventoryApi.id
}

output "inventory_api_public_subnet_b_id" {
  value = aws_subnet.inventoryApi2.id
}

output "inventory_api_sg_id" {
  value = aws_security_group.inventoryApi.id
}