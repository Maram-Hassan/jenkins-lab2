#create subnet
resource "aws_subnet" "terraform-subnet" {
  vpc_id     = aws_vpc.terraform-vpc.id
  cidr_block = var.subnet_block

  tags = {
    Name = var.subnet_name
  }
}

resource "aws_route_table_association" "subnet-route-table-association" {
  subnet_id      = aws_subnet.terraform-subnet.id
  route_table_id = aws_route_table.terraform-routeTable.id  # Correct reference
}





