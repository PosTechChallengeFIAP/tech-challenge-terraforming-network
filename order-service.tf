resource "aws_subnet" "orderApi" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "tech-challenge-order-service-public-subnet_a"
  }
}

resource "aws_subnet" "orderApi2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "tech-challenge-order-service-public-subnet_b"
  }
}

resource "aws_internet_gateway" "orderApi" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "tech-challenge-order-service-igw"
  }
}

resource "aws_route_table" "orderApi" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.orderApi.id
  }

  tags = {
    Name = "tech-challenge-order-service-public-route-table"
  }
}

resource "aws_route_table_association" "orderApi" {
  subnet_id      = aws_subnet.orderApi.id
  route_table_id = aws_route_table.orderApi.id
}

resource "aws_route_table_association" "orderApi2" {
  subnet_id      = aws_subnet.orderApi2.id
  route_table_id = aws_route_table.orderApi.id
}

resource "aws_security_group" "orderApi" {
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
    Name = "tech-challenge-order-service-sg"
  }
}