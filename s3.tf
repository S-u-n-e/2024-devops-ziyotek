# resource "aws_s3_bucket" "ziyotek_bucket" {
#   bucket = "sun-name-devops-bucket"

#   tags = {
#     Name        = "My bucket "
#     Environment = "Dev"
#   }
# }

# //versioning 

# resource "aws_s3_bucket_versioning" "s3_versioning" {
#   bucket = aws_s3_bucket.ziyotek_bucket.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# //Object lock for s3 

# resource "aws_s3_bucket_object_lock_configuration" "ziyotek_bucket" {
#   bucket = aws_s3_bucket.ziyotek_bucket.id

#   rule {
#     default_retention {
#       mode = "COMPLIANCE"
#       days = 5
#     }
#   }
# }


# //encryptions on s3

# resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
#   bucket = aws_s3_bucket.ziyotek_bucket.id

#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "AES256"
#     }
#   }
# }

# # resource "aws_s3_bucket_acl" "ziyotek_bucket" {
# #   bucket = aws_s3_bucket.ziyotek_bucket.id
# #   acl    = "public-read"
# # }

