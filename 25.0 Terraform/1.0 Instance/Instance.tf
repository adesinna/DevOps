provider "aws" { # this is the provider
  region = "us-west-1"

}

resource "aws_instance" "tester-server" {
  ami = "ami-0f8e81a3da6e2510a"
  instance_type = "t2.micro"
  availability_zone = "us-west-1a"
  key_name = "jenkins-key"
  vpc_security_group_ids = ["sg-0bc52d08f07418221"]
  tags = {
    Name = "test"
  }
}