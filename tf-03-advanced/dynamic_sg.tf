# This example demonstrates dynamically creating security group rules 
# based on input lists. This approach allows you to easily scale and 
# modify the rules by changing a single list.
# Dynamic Block (ingress): The dynamic block allows you to generate the 
# ingress rules dynamically based on the allowed_ports variable. 
# Each port in the list creates a new ingress rule.

variable "allowed_ports" {
  description = "List of ports to allow in the security group"
  type        = list(number)
  default     = [80, 443, 22]
}

resource "aws_security_group" "sg" {
  name        = "my-security-group"
  description = "Security group with dynamic rules"
  vpc_id = module.vpc.vpc_id
  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "MyDynamicSecurityGroup"
  }
}
