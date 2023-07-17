resource "aws_security_group" "security_group_demo" {
  name = "kannis-terrafrom-varsec-group"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc_demo.cidr_block]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc_demo.cidr_block]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc_demo.cidr_block]
  }
}
