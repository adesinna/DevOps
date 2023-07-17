resource "aws_instance" "test_server" {
  ami = var.AMIS[var.REGION] # create the ami in that region!
  instance_type = "t2.micro"
  availability_zone = var.ZONE1
  key_name = "jenkins-key" # make sure you do not change key
  vpc_security_group_ids = ["sg-0bc52d08f07418221"]
  tags = {
    Name = "test"
    Use = "terraform work"
  }
}

