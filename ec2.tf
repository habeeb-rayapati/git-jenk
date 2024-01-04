#Create EC2 Instance
resource "aws_instance" "jenkins-ec2" {
  ami                    = "ami-051f7e7f6c2f40dc1"
  instance_type          = "t2.micro"
  key_name               = "useme-aws"
  user_data              = file("install_jenksin.sh")
  vpc_security_group_ids = [aws_security_group.myjenkins_sg.id]
  iam_instance_profile = aws_iam_instance_profile.s3-jenkins-profile-week20.name
  tags = {
    Name = "Myweek20project"
  }

}