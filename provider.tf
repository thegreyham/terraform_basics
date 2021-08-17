provider "aws" {
    region = var.region
    shared_credentials_file = "~/.aws/credentials"
    default_tags {
      tags = {
          "Provisioned" = var.provisioned
      }
    }
}