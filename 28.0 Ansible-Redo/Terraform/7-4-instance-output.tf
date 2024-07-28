output "ec2_private_ip_client_instances" {
  description = "List of private IP addresses assigned to the instances"
  value = [
    for ec2private in module.instance: 
      ec2private.private_ip 
    ]  
}