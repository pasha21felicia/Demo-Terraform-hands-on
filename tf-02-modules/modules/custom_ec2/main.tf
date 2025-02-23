# 🔹 Call the EC2 Module
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name                   = var.instance_name
  instance_type          = var.instance_type
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  subnet_id              = var.subnet_id
  # environment = var.environment
}

# 🔹 Create Security Group for EC2
resource "aws_security_group" "ec2_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.instance_name}-sg"
  }
}
