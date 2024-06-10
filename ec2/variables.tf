variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instance will be deployed."
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group to attach to the EC2 instance."
  type        = string
}
