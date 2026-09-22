terraform {
  backend "s3" {
    bucket       = "hello-eks-devops-assignment-tfstate-668471253381"
    key          = "infrastructure/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}