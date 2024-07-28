resource "null_resource" "control_config" {
  depends_on = [module.control-plane-instance]

  provisioner "local-exec" { # in the machine where terraform is being run
    command = "sudo chmod 400 terraform-key-pair.pem"
    working_dir = "private-key/" # create this folder
  }

  # Connection Block for Provisioners to connect to EC2 Instance
  connection { # so it execute the neccessary commands below
    type     = "ssh" 
    host     = module.control-plane-instance.public_ip  
    user     = "ubuntu"
    
    private_key = file("private-key/terraform-key-pair.pem")
  }  

## File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
  provisioner "file" {
    source      = "private-key/terraform-key-pair.pem" # provide it on the host machine
    destination = "/home/ubuntu/terraform-key-pair.pem"
  }

  provisioner "remote-exec" {
    inline = [

      "sudo chmod 400 /home/ubuntu/terraform-key-pair.pem",
      "mkdir -p /home/ubuntu/group_vars",
      "echo 'private_ip_1: ${module.instance[0].private_ip}' >> /home/ubuntu/group_vars/all",
      "echo 'private_ip_2: ${module.instance[1].private_ip}' >> /home/ubuntu/group_vars/all",
      "echo 'private_ip_3: ${module.instance[2].private_ip}' >> /home/ubuntu/group_vars/all"
    ]
  }

 

  provisioner "local-exec" { # in the machine where terraform is being run
    command = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exec-output-files/" # create this folder
  }

}



