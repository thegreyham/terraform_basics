

# create server
resource "aws_instance" "tf-instance" {
  ami = var.ami
  availability_zone = var.availability_zone_1
  instance_type = "t2.micro"
  key_name = var.keypair
  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.tf-nic.id
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install apache2 -y
              sudo systemctl start apache2
              sudo bash -c 'echo my web server > /var/www/html/index.html'
              EOF
  tags = {
    Name = "MyServer"
  }
}
