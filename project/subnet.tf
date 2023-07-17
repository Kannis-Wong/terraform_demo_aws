resource "aws_subnet" "subnet_demo" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.vpc_demo.id
  cidr_block        = cidrsubnet("10.0.0.0/16", 8, count.index)
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "subnet-demo-${count.index}"
  }
}
