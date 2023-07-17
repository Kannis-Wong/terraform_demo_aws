# local variables
locals {
  prod_tag = {
    Owner   = "app-team"
    Service = "backend"
  }
  dev_tag = {
    Owner   = "dev-team"
    Service = "development"
  }
}

# Use this data source to get the ID of a registered AMI for use in other resources.
data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-*"]
  }
}

# Use module from modules folder to create resources, position parameters can be named differently
module "aws_ec2_first" {
  source = "../modules/"
  ami    = data.aws_ami.app_ami.id
  type   = "t2.micro"
  tag    = local.dev_tag
  #subnet = 
}

module "aws_ec2_second" {
  source = "../modules/"
  ami    = data.aws_ami.app_ami.id
  type   = "t2.micro"
  tag    = local.prod_tag
}

output "out_ec2_first" {
  value = module.aws_ec2_first.instance_id
}

output "out_ec2_second" {
  value = module.aws_ec2_second.instance_id
}