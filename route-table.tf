# public route table

resource "aws_route_table" "tf-route-public" {
  vpc_id = aws_vpc.tf-vpc.id
}

resource "aws_route" "public-route" {
  route_table_id = aws_route_table.tf-route-public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.tf-vpc-igw.id
}

# Elastic Ip and Nat Gateway

resource "aws_eip" "tf-eip" {
  
}

resource "aws_nat_gateway" "rt-nat" {
  allocation_id = aws_eip.tf-eip.id
  subnet_id = aws_subnet.public.id
}

# private route table

resource "aws_route_table" "tf-route-private" {
  vpc_id = aws_vpc.tf-vpc.id
}

resource "aws_route" "private-route" {
  route_table_id = aws_route_table.tf-route-private.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.rt-nat.id
}

# Route table allocation

resource "aws_route_table_association" "tf-public-route" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route.public-route.id
}

resource "aws_route_table_association" "tf-backend-private-route" {
  subnet_id = aws_subnet.private-backend.id
  route_table_id = aws_route_table.tf-route-private.id
}

resource "aws_route_table_association" "tf-db-private-route" {
  subnet_id = aws_subnet.private-db.id
  route_table_id = aws_route_table.tf-route-private.id
}