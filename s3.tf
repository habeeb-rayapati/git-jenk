#Create S3 bucket for Jenksin Artifacts
resource "aws_s3_bucket" "my-s3-bucket" {
  bucket = "jenkins-s3-bucket-week20terraformmmmm"

  tags = {
    Name = "Jenkins-Server"
  }
}

#make sure is prive and not open to public and create Access control List
resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket     = aws_s3_bucket.my-s3-bucket.id
  acl        = "private"
  depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_acl_ownership]
}

# Resource to avoid error "AccessControlListNotSupported: The bucket does not allow ACLs"
resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  bucket = aws_s3_bucket.my-s3-bucket.id
  rule {
    object_ownership = "ObjectWriter"
  }
}