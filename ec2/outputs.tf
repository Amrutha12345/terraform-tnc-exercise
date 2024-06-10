output "instance_id" {
  value = aws_instance.tnc_ec2.id
}

output "public_ip" {
  value = aws_instance.tnc_ec2.public_ip
}

output "key_pair_name" {
  description = "The name of the key pair used by the EC2 instance"
  value       = aws_key_pair.tnc_keypair.key_name
}

