provider "aws" {
  region = "ap-south-1"

  default_tags {
    tags = {
      project = "project2-monolith"
    }
  }
}