# Creating VPC   
# net 172.33.2.0/23
resource "aws_vpc" "demovpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "Demo VPC"
  }
}

# Creating Internet Gateway 
resource "aws_internet_gateway" "demogateway" {
  vpc_id = aws_vpc.demovpc.id
}

# Grant the internet access to VPC by updating its main route table
resource "aws_route" "internet_access" {
  route_table_id         = aws_vpc.demovpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.demogateway.id
}

# Creating 1st subnet 
resource "aws_subnet" "demosubnet1" {
  vpc_id                  = aws_vpc.demovpc1.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.aws_region

  tags = {
    Name = "Demo subnet"
  }
}



