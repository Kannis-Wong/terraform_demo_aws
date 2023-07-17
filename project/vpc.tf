# Create a VPC with 10.0.0.0
resource "aws_vpc" "vpc_demo" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc_demo"
  }
}
