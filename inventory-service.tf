resource "aws_subnet" "inventoryApi" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.40.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "tech-challenge-inventory-service-public-subnet_a"
  }
}

resource "aws_subnet" "inventoryApi2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.41.0/24"
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "tech-challenge-inventory-service-public-subnet_b"
  }
}

resource "aws_route_table" "inventoryApi" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "tech-challenge-inventory-service-public-route-table"
  }
}

resource "aws_route_table_association" "inventoryApi" {
  subnet_id      = aws_subnet.inventoryApi.id
  route_table_id = aws_route_table.inventoryApi.id
}

resource "aws_route_table_association" "inventoryApi2" {
  subnet_id      = aws_subnet.inventoryApi2.id
  route_table_id = aws_route_table.inventoryApi.id
}

resource "aws_security_group" "inventoryApi" {
  vpc_id = aws_vpc.main.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tech-challenge-inventory-service-sg"
  }
}