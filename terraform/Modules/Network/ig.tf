resource "aws_internet_gateway" "vpc_gw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "VPC-IG"
  }
}