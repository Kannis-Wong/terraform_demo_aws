# this is just for demo to simply create elastic ip address, you can attach to EC2 instance
resource "aws_eip" "eip_demo" {
  #instance = module.aws_ec2_first.id/module.aws_ec2_second.id
  vpc = true
}

/*
resource "aws_eip_association" "demo-eip-association" {
  instance_id   = module.aws_ec2_first.id
  allocation_id = aws_eip.eip_demo.id
}
*/

output "eip" {
  value = aws_eip.eip_demo
}
