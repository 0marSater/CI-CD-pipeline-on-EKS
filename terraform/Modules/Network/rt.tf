# public rt
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = var.public_rt_cidr
    gateway_id = aws_internet_gateway.vpc_gw.id
  }

  tags = {
    Name = var.public_rt_name
  }
}


# attach public rt to public subnets
resource "aws_route_table_association" "attach_public_subnet_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "attach_public_subnet_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}



