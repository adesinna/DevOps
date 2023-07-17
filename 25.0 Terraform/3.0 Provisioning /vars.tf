variable "REGION" {
  default = "us-west-1"
}

variable "ZONE1" {
  default = "us-west-1a"
}

variable "AMIS" {
  type = map
  default = {
    us-west-1 = "ami-0fd61683ae1a27a64" # it will pick this ami whenever the region is given

  }
}

variable "USER" {
  default = "ec2-user"
}