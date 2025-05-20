resource "aws_subnet" "app_subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "tech-challenge-public-subnet_a"
  }
}

resource "aws_subnet" "app_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "tech-challenge-public-subnet_b"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "tech-challenge-igw"
  }
}

resource "aws_route_table" "app" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "tech-challenge-public-route-table"
  }
}

resource "aws_route_table_association" "app" {
  subnet_id      = aws_subnet.app_subnet_1.id
  route_table_id = aws_route_table.app.id
}

resource "aws_route_table_association" "app2" {
  subnet_id      = aws_subnet.app_subnet_2.id
  route_table_id = aws_route_table.app.id
}

resource "aws_security_group" "app" {
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
    Name = "tech-challenge-sg"
  }
}