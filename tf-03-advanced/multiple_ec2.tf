# This example dynamically creates EC2 instances with different 
# instance types and AMIs based on input variables.
# for_each: The EC2 instances are created dynamically 
# based on the instances map variable. Each entry in the map 
# corresponds to an instance, and the attributes like ami_id and 
# instance_type are set dynamically.

variable "instances" {
  description = "Map of instance configurations"
  type = map(object({
    ami_id      : string
    instance_type : string
  }))
  default = {
    "web_server" = {
      ami_id      = "ami-06ee6255945a96aba"
      instance_type = "t2.micro"
    },
    "db_server" = {
      ami_id      = "ami-07eef52105e8a2059"
      instance_type = "t2.large"
    }
  }
}

resource "aws_instance" "ec2_instances" {
  for_each = var.instances

  # Correctly reference the subnet using `subnet_id`
  ami               = each.value.ami_id
  instance_type     = each.value.instance_type
  availability_zone = "eu-central-1a"  # Example region and availability zone
  tags = {
    Name = each.key
  }
}