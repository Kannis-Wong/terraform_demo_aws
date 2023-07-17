# this is just for demo to simply create S3 bucket
resource "aws_s3_bucket" "mys3" {
  bucket = "kannisterraformtest"
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3
}
