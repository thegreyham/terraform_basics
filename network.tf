

# create security group
resource "aws_security_group" "tf-sg" {
    name = "all_web_traffic"
    description = "Allow inbout web traffic"
    vpc_id = aws_vpc.tf-vpc.id

    ingress {
        description = "HTTPS"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = [ var.my_ip ]
    }
    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [ var.my_ip ]
    }
    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ var.my_ip ]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
    tags = {
        Name = "MyHomeSG"
  }
}

# create network interface
resource "aws_network_interface" "tf-nic" {
  subnet_id = aws_subnet.tf-subnet-1.id
  private_ips = [ "10.0.1.50" ]
  security_groups = [ aws_security_group.tf-sg.id ]
  tags = {
        Name = "MyNIC"
  }
}

# create elastic ip
resource "aws_eip" "tf-eip" {
  vpc = true
  network_interface = aws_network_interface.tf-nic.id
  associate_with_private_ip = "10.0.1.50"
  depends_on = [
    aws_internet_gateway.tf-gateway
  ]
  tags = {
        Name = "IPForServer"
  }
}