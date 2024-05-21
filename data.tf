data "aws_ami" "example" {
  most_recent      = true
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["myami-*"]
  }
}

data "aws_s3_bucket" "selected" {
    bucket = "ziyotek-sun44"
}

output name {
    value = aws_s3_bucket.selected.arn
}