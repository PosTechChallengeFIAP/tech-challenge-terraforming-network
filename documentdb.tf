resource "aws_subnet" "private_subnet_docdb_a" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = "10.0.5.0/24"
    availability_zone       = "us-west-2a"
    map_public_ip_on_launch = false

    tags = {
        Name = "tech-challenge-docdb-private-subnet-a"
    }
}

resource "aws_subnet" "private_subnet_docdb_b" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = "10.0.6.0/24"
    availability_zone       = "us-west-2b"
    map_public_ip_on_launch = false

    tags = {
        Name = "tech-challenge-docdb-private-subnet-b"
    }
}

resource "aws_db_subnet_group" "docdb_subnet_group" {
    name       = "tech-challenge-docdb-subnet-group"
    subnet_ids = [aws_subnet.private_subnet_docdb_a.id, aws_subnet.private_subnet_docdb_b.id]

    tags = {
        Name = "tech-challenge-docdb-subnet-group"
    }
}

resource "aws_security_group" "docdb_sg" {
    name        = "tech-challenge-docdb-sg"
    description = "Security group for docdb database"
    vpc_id      = aws_vpc.main.id

    ingress {
        from_port   = 27017
        to_port     = 27017
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
        Name = "tech-challenge-docdb-sg"
    }
}

