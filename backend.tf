terraform {
  backend "s3" {
    bucket = "netflix334"
    key    = "sonar/terraform.tfstate"
    region = "us-east-2" # Change to your desired region

  }
}
