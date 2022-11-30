resource "aws_key_pair" "mykey"{
  key_name = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "example" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name = aws_key_pair.my_key.key_name
}

# this provisioner uploads file
provisioner "file" { 
  source      = "script.sh"
  destination = "/tmp/script.sh"
}

# this provisioner will add executable permissions & will execute it
provisioner "remote-exec"{
  inline = [
    "chmod +x /tmp/script.sh",
    "sudo /tmp/script.sh"
  ]
}

connection {
    user = var.INSTANCE_USERNAME
    password = file(var.PATH_TO_PRIVATE_KEY)
}
