# Define Local Values in Terraform
// They allow you to combine variables, you also use local values 
locals {
  owners = var.business_division
  environment = var.environment
  name = "${var.business_division}-${var.environment}" # concatenating variables, this is why we use local values
  #name = "${local.owners}-${local.environment}" # using local to refer
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
} 