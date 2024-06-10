output "subnet_ids" {
  value = [aws_subnet.tnc_subnet_1.id, aws_subnet.tnc_subnet_2.id]
}