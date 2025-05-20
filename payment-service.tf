resource "aws_subnet" "paymentApi" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.30.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "tech-challenge-payment-service-public-subnet_a"
  }
}

resource "aws_subnet" "paymentApi2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.31.0/24"
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "tech-challenge-payment-service-public-subnet_b"
  }
}

resource "aws_internet_gateway" "paymentApi" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "tech-challenge-payment-service-igw"
  }
}

resource "aws_route_table" "paymentApi" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.paymentApi.id
  }

  tags = {
    Name = "tech-challenge-payment-service-public-route-table"
  }
}

resource "aws_route_table_association" "paymentApi" {
  subnet_id      = aws_subnet.paymentApi.id
  route_table_id = aws_route_table.paymentApi.id
}

resource "aws_route_table_association" "paymentApi2" {
  subnet_id      = aws_subnet.paymentApi2.id
  route_table_id = aws_route_table.paymentApi.id
}

resource "aws_security_group" "paymentApi" {
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
    Name = "tech-challenge-payment-service-sg"
  }
}