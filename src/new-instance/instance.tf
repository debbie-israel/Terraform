resource "aws_instance" "example" {
  # ami           = "ami-0f29c8402f8cce65c"
  ami           = ${lookup(var.AMIS, var.AWS_REGION)}
  instance_type = "t2.micro"
}
