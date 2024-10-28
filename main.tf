
# Create an EC2 instance
resource "aws_instance" "my_ec2" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ami_key_pair.key_name
  security_groups = [aws_security_group.sec_group.name]

  tags = {
    Name = "my-ec2"
  }
}

