resource "aws_subnet" "private_subnet_postgres_a" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "us-west-2a"
    map_public_ip_on_launch = false

    tags = {
        Name = "tech-challenge-postgres-private-subnet-a"
    }
}

resource "aws_subnet" "private_subnet_postgres_b" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = "10.0.2.0/24"
    availability_zone       = "us-west-2b"
    map_public_ip_on_launch = false

    tags = {
        Name = "tech-challenge-postgres-private-subnet-b"
    }
}

resource "aws_db_subnet_group" "postgres_subnet_group" {
    name       = "tech-challenge-postgres-subnet-group"
    subnet_ids = [aws_subnet.private_subnet_postgres_a.id, aws_subnet.private_subnet_postgres_b.id]

    tags = {
        Name = "tech-challenge-postgres-subnet-group"
    }
}

resource "aws_security_group" "postgres_sg" {
    name        = "tech-challenge-postgres-sg"
    description = "Security group for PostgreSQL database"
    vpc_id      = aws_vpc.main.id

    ingress {
        from_port   = 5432
        to_port     = 5432
        protocol    = "tcp"
        cidr_blocks = ["10.0.0.0/16"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "tech-challenge-postgres-sg"
    }
}

