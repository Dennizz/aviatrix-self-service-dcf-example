terraform {
  required_providers {
    aviatrix = {
      source  = "AviatrixSystems/aviatrix"
      version = "3.2.1"
    }
  }
}

provider "aviatrix" {
  # Credentials set using environmental variables in the deployment pipeline.
  # https://registry.terraform.io/providers/AviatrixSystems/aviatrix/latest/docs#environment-variables

  # $ export AVIATRIX_CONTROLLER_IP="1.2.3.4"
  # $ export AVIATRIX_USERNAME="admin"
  # $ export AVIATRIX_PASSWORD="password"
}
