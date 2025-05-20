resource "aws_subnet" "queueApi" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.20.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "tech-challenge-queue-service-public-subnet_a"
  }
}

resource "aws_subnet" "queueApi2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.21.0/24"
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "tech-challenge-queue-service-public-subnet_b"
  }
}

resource "aws_internet_gateway" "queueApi" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "tech-challenge-queue-service-igw"
  }
}

resource "aws_route_table" "queueApi" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.queueApi.id
  }

  tags = {
    Name = "tech-challenge-queue-service-public-route-table"
  }
}

resource "aws_route_table_association" "queueApi" {
  subnet_id      = aws_subnet.queueApi.id
  route_table_id = aws_route_table.queueApi.id
}

resource "aws_route_table_association" "queueApi2" {
  subnet_id      = aws_subnet.queueApi2.id
  route_table_id = aws_route_table.queueApi.id
}

resource "aws_security_group" "queueApi" {
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
    Name = "tech-challenge-queue-service-sg"
  }
}