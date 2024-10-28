resource "aws_security_group" "sec_group" {
  name        = "sec-group"
  description = "Allow HTTP, HTTPS, and SSH traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Change this for better security
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096

}

resource "aws_key_pair" "ami_key_pair" {
  key_name   = "my-key"
  public_key = var.public_key
}

resource "null_resource" "generate_key" {
  provisioner "local-exec" {
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./my-key.pem"
  }
}

