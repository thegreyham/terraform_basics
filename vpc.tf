

# create VPC
resource "aws_vpc" "tf-vpc" {
  cidr_block = var.subnet_prefix
  tags = {
    Name = "TerraformVPC"
  }
}

# create internet gateway
resource "aws_internet_gateway" "tf-gateway" {
  vpc_id = aws_vpc.tf-vpc.id
  tags = {
        Name = "MyIGW"
  }
}

# create route table
resource "aws_route_table" "tf-route-table" {
  vpc_id = aws_vpc.tf-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf-gateway.id
  }

  route {
      ipv6_cidr_block = "::/0"
      gateway_id = aws_internet_gateway.tf-gateway.id
  }
  tags = {
        Name = "MyRT"
  }
}

# create subnet
resource "aws_subnet" "tf-subnet-1" {
  vpc_id = aws_vpc.tf-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.availability_zone_1
  tags = {
        Name = "MySubnet"
  }
}

# associate route table with subnet
resource "aws_route_table_association" "a" {
  subnet_id = aws_subnet.tf-subnet-1.id
  route_table_id = aws_route_table.tf-route-table.id
}