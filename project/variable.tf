variable "instance_type" {
  default = "t2.micro"
}

variable "image_id" {
  type    = string
  default = "test_image"
}

variable "user_name" {
  type    = string
  default = "test-terraform-kannis"
}

variable "ec2_types" {
  type = map(any)
  default = {
    us-east-1  = "t2.small"
    us-west-2  = "t2.nano"
    ap-south-1 = "t2.micro"
  }
}

variable "ec2_tlist" {
  type    = list(any)
  default = ["t2.small", "t2.nano", "t2.micro"]
}

variable "iam_user_list" {
  type    = list(any)
  default = ["kan-01", "prod-02", "dev-03"]
}

variable "availability_zones" {
  type    = list(any)
  default = ["ap-southeast-1a", "ap-southeast-1b"]
}
