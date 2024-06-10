output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = module.subnets.subnet_ids
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = module.sg.security_group_id
}

output "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  value       = module.ec2.instance_id
}

output "ec2_instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = module.ec2.public_ip
}

output "key_pair_name" {
  description = "The name of the key pair used by the EC2 instance"
  value       = module.ec2.key_pair_name
}
