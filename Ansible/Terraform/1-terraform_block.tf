terraform {
  required_version = ">= 1.6" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.0"
    }
    null = {
      source = "hashicorp/null" # to use the null resources
      version = "~> 3.0"
    }    
  }
}

