provider "aws" {
  access_key = "HRPHYZTSEY7FKRJSV2WW" 
  secret_key = "K+Ql26+9HCitmwAjvO317VvfqmJKbnX7VrCfXg5g"
  region     = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0f29c8402f8cce65c"
  instance_type = "t2.micro"
}

# pd: access & secret keys are made up but with the same string length both should have