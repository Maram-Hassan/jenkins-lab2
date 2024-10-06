resource "aws_instance" "TerraformInstance" {
  ami                         = "ami-0c2b8ca1dad447f8a" # Amazon Linux 2 AMI (Free Tier eligible in us-east-1)
  instance_type               = "t2.micro" # Free Tier eligible instance type
  subnet_id                   = aws_subnet.terraform-subnet.id
  associate_public_ip_address = true
  # Attach the security group
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]

  tags = {
    Name = "TerraformInstance"
  }
}

resource "aws_security_group" "allow_http_ssh" {
  name        = "allow_http_ssh"
  description = "Security group to allow HTTP, custom port 5000, and SSH traffic"
  vpc_id      = aws_vpc.terraform-vpc.id # Associate with the correct VPC

  # Ingress rules (incoming traffic)
  
  # Allow HTTP traffic
  ingress {
    description = "Allow HTTP (IPv4)"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows HTTP traffic from any IPv4 address
  }

  # Allow traffic on port 5000 (your application port)
  ingress {
    description = "Allow traffic on port 5000 (IPv4)"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows traffic on port 5000 from any IPv4 address
  }

  # Allow SSH traffic
  ingress {
    description = "Allow SSH (IPv4)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows SSH traffic from any IPv4 address
  }

  tags = {
    Name = "allow_http_ssh"
  }
}

