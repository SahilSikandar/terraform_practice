resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name="My_Vpc"
  }
}
resource "aws_subnet" "my-private-subnet" {
    vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    name="My-private-Subnet"
  }
}
resource "aws_subnet" "my-public-subnet" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.2.0/24"
   map_public_ip_on_launch = true
  tags = {
    name="My-public-subnet"
  }
}
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.my-vpc.id
    tags = {
      name="internet-gateway"
    }

}

resource "aws_route_table" "my-table" {
    vpc_id = aws_vpc.my-vpc.id
    
    route  {
        cidr_block="0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
  
}
resource "aws_route_table_association" "rta" {
    route_table_id = aws_route_table.my-table.id
    subnet_id=aws_subnet.my-public-subnet .id  
}