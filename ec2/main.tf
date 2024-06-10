# Data to fetch the latest Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical's official Ubuntu AMIs
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-*-amd64-server-*"]
  }
}

# Generate a new key pair
resource "tls_private_key" "tnc_keypair" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create the key pair in AWS using the generated public key
resource "aws_key_pair" "tnc_keypair" {
  key_name   = "tnc_keypair"
  public_key = tls_private_key.tnc_keypair.public_key_openssh
}

# Store the private key in AWS Secrets Manager
resource "aws_secretsmanager_secret" "tnc_key_secret" {
  name = "tnc_keypair_secret"
}

resource "aws_secretsmanager_secret_version" "tnc_key_secret_version" {
  secret_id     = aws_secretsmanager_secret.tnc_key_secret.id
  secret_string = tls_private_key.tnc_keypair.private_key_pem
}

# EC2 instance resource
resource "aws_instance" "tnc_ec2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = aws_key_pair.tnc_keypair.key_name
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y apache2
              echo 'Hello, TNC!' > /var/www/html/index.html
              sudo systemctl start apache2
              sudo systemctl enable apache2
              EOF

  tags = {
    Name = "tnc_ec2_instance"
  }
}


