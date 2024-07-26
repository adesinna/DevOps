module "control-plane-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  depends_on = [ module.vpc ] # creates this vpc before the instance
  version = "5.6.0"
  name                   = "${var.environment}-control-plane"
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type_t2
  key_name               = var.instance_keypair # create the key on aws
  subnet_id              = module.vpc.public_subnets[0] 
  vpc_security_group_ids = [module.control-sg.security_group_id]
  user_data = file("${path.module}/ansible_install.sh")
  associate_public_ip_address = true 
  tags = local.common_tags
}

module "instance" {
  depends_on = [ module.vpc ] # VERY VERY IMPORTANT else userdata webserver provisioning will fail
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"
  
  name                   = "${var.environment}-web-${each.key}"
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type_t2
  key_name               = var.instance_keypair
  tags                   = merge(local.common_tags, { "Name" = "${var.environment}-app-${each.key}" })

  vpc_security_group_ids = [module.client-sg.security_group_id]
  for_each               = toset(["0", "1", "2"]) # Create three instances
  subnet_id              = element(module.vpc.public_subnets, each.key % length(module.vpc.public_subnets))  # Cycle through subnets
  associate_public_ip_address = true 
}
