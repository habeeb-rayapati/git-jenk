# #Configure the AWS Provider
# provider "aws" {
#   region = "us-east-1"
# }

# #Create EC2 Instance
# resource "aws_instance" "jenkins-ec2" {
#   ami                    = "ami-051f7e7f6c2f40dc1"
#   instance_type          = "t2.micro"
#   key_name               = "useme-aws"
#   user_data              = file("install_jenksin.sh")
#   vpc_security_group_ids = [aws_security_group.myjenkins_sg.id]
#   tags = {
#     Name = "Myweek20project"
#   }

# }
# #Create security group 
# resource "aws_security_group" "myjenkins_sg" {
#   name        = "jenkins_sg20"
#   description = "Allow inbound ports 22, 8080"
#   vpc_id      = "vpc-020967ed6d2a519f1"

#   #Allow incoming TCP requests on port 22 from any IP
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   #Allow incoming TCP requests on port 443 from any IP
#   ingress {
#     description = "Allow HTTPS Traffic"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   #Allow incoming TCP requests on port 8080 from any IP
#   ingress {
#     from_port   = 8080
#     to_port     = 8080
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   #Allow all outbound requests
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   tags = {
#     Name = "project-sg"
#   }
# }


# #Create S3 bucket for Jenksin Artifacts
# resource "aws_s3_bucket" "my-s3-bucket" {
#   bucket = "jenkins-s3-bucket-week20terraformmmmm"

#   tags = {
#     Name = "Jenkins-Server"
#   }
# }

# #make sure is prive and not open to public and create Access control List
# resource "aws_s3_bucket_acl" "s3_bucket_acl" {
#   bucket     = aws_s3_bucket.my-s3-bucket.id
#   acl        = "private"
#   depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_acl_ownership]
# }

# # Resource to avoid error "AccessControlListNotSupported: The bucket does not allow ACLs"
# resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
#   bucket = aws_s3_bucket.my-s3-bucket.id
#   rule {
#     object_ownership = "ObjectWriter"
#   }
# }


