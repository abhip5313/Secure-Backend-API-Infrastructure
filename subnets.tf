resource "aws_subnet" "public" {
  vpc_id = aws_vpc.tf-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private-backend" {
  vpc_id = aws_vpc.tf-vpc.id
  cidr_block = "10.0.2.0/24"
}

resource "aws_subnet" "private-db" {
  vpc_id = aws_vpc.tf-vpc.id
  cidr_block = "10.0.3.0/24"
}