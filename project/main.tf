/* Identify the aws provider version using required_provides block.
In the best practice, specify the only one version can be more safe than use range constraints in production, each updated plugins may have new syntax that makes your code errors.
In below example, we have downloaded the version 4.63.0 for the aws plugin 
*/
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.63.0"
    }
  }
}

# Below creating two sperate aws providers block for multiple regions resources

# This is the default aws provider, region is singapore
provider "aws" {
  region = "ap-southeast-1"
}

# tagged alias is for additional region, region is tokyo
provider "aws" {
  alias  = "tokyo"
  region = "ap-northeast-1"
}
