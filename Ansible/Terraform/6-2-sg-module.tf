module "control-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name        = "control-sg"
  description = "Security group for the control plane"
  vpc_id      = module.vpc.vpc_id

  tags = local.common_tags


  # Ingress and Egress Rules
   ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "142.189.98.182/32"
      description = "Allow SSH from my IP"
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
      description = "Allow all outbound traffic"
    }
  ]

}

module "client-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name        = "client-sg"
  description = "Security group for the clients"
  vpc_id      = module.vpc.vpc_id

  tags = local.common_tags


 ingress_with_source_security_group_id = [
    {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        source_security_group_id = module.control-sg.security_group_id
        description = "Allow SSH from bastion host"

    }
 ]

ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "142.189.98.182/32"
      description = "Allow SSH from my IP"
    }
  ]

egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
      description = "Allow all outbound traffic"
    }
  ]

}