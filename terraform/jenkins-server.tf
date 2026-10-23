resource "aws_key_pair" "jenkins_key_pair" {
  key_name   = "jenkins-pipeline-key"
  public_key = file("jenkins-server-key.pub")
}

resource "aws_instance" "jenkins_server" {
  ami = "ami-0c7632fb77f35db43"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  key_name = aws_key_pair.jenkins_key_pair.key_name
  user_data = file("userdata.sh")

  tags = {
    Name = "Jenkins-PipeLine-Server"
  }
}