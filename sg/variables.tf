variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "allowed_ip" {
  description = "The IP address allowed for SSH access."
  type        = string
}
