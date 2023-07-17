resource "aws_lb" "lb_test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "network"
  subnets            = [for subnet in aws_subnet.subnet_demo : subnet.id]

  enable_deletion_protection = true

  tags = {
    Environment = "Production"
  }
}
