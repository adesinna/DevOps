resource "aws_key_pair" "website-key" {  # this creates key-pair on aws
  key_name = "website-key"
  public_key = file("website-key.pub")
}

resource "aws_instance" "website-instance" {
  ami = var.AMIS[var.REGION]
  instance_type = "t2.micro"
  availability_zone = var.ZONE1
  key_name = aws_key_pair.website-key.key_name # this how to refer to the key
  vpc_security_group_ids = ["sg-0bc52d08f07418221"]
  tags = {
    Name = "test"
    Use = "terraform work"
  }

  provisioner "file" {
    source = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user = var.USER
    private_key = file("website-key")
    host = self.public_ip

  }
}

# to print things
output "PublicIP" {
  value = aws_instance.website-instance.public_ip
}

output "PrivateIP" {
  value = aws_instance.website-instance.private_ip
}