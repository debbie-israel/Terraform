resource "aws_instance" "example" {
  ami           = "ami-0f29c8402f8cce65c"
  instance_type = "t2.micro"
}
