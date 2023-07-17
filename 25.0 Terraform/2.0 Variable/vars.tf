variable "REGION" {
  default = "us-west-1"
}

variable "ZONE1" {
  default = "us-west-1a"
}

variable "AMIS" {
  type = map
  default = {
    us-west-1 = "ami-0f8e81a3da6e2510a" # it will pick this ami whenever the region is given

  }
}