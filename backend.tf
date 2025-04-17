terraform {
  backend "s3" {
    bucket         = "s3-codepipeline-eks-bucket"
    key            = "eks/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
  }
}
