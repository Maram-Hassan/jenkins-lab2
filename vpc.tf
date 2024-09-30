# Create a VPC
resource "aws_vpc" "terraform-vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_name
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    Name = var.internet_gateway_name
  }
}

# Create a Route Table
resource "aws_route_table" "terraform-routeTable" {
  vpc_id = aws_vpc.terraform-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  

  tags = {
    Name = "TerraformRouteTable"
  }
}

# Associate the Route Table with the Subnet
resource "aws_route_table_association" "terraform-routeTable" {
  subnet_id      = aws_subnet.terraform-subnet.id # Make sure to reference the correct subnet
  route_table_id = aws_route_table.terraform-routeTable.id # Corrected reference
}
