# # Create a Subnet
# resource "aws_subnet" "terraform-subnet" {
#   vpc_id     = aws_vpc.terraform-vpc.id
#   cidr_block = var.subnet_block

#   tags = {
#     Name = var.subnet_name
#   }
# }
# # Create a Route Table
# resource "aws_route_table" "terraform-routeTable" {
#   vpc_id = aws_vpc.terraform-vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.gw.id
#   }

#   tags = {
#     Name = var.route_table_name
#   }
# }
# # Associate the Route Table with the Subnet
# resource "aws_route_table_association" "subnet-route-table-association" {
#   subnet_id      = aws_subnet.terraform-subnet.id
#   route_table_id = aws_route_table.terraform-routeTable.id  # Correct reference
# }


