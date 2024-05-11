provider "aws" {
    shared_credentials_files = ["~/.aws/credentials"]
    region = "us-east-1"
    profile = "${var.profile}"
}

provider "local" {}
