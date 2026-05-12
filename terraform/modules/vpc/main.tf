resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name        = "${var.project_name}-${var.environment}-vpc"
    Environment = var.environment
    Project     = var.project_name
  }
}


resource "aws_subnet" "public1" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_1_cidr
  availability_zone = "eu-west-1a"
  tags = {
    Type = "public"
    Name        = "${var.project_name}-${var.environment}-public-subnet-1"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_subnet" "public2" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_2_cidr
  availability_zone = "eu-west-1b"
  tags = {
    Type = "public"
    Name        = "${var.project_name}-${var.environment}-public-subnet-2"
    Environment = var.environment
    Project     = var.project_name
  }
}


resource "aws_subnet" "private1" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_1_cidr
  availability_zone = "eu-west-1a"
  tags = {
    Type = "private"
    Name        = "${var.project_name}-${var.environment}-private-subnet-1"
    Environment = var.environment
    Project     = var.project_name
  }
}


resource "aws_subnet" "private2" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_2_cidr
  availability_zone = "eu-west-1b"
  tags = {
    Type = "private"
    Name        = "${var.project_name}-${var.environment}-private-subnet-2"
    Environment = var.environment
    Project     = var.project_name
  }
}


resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.main.id
  tags = {
    Type = "public"
    Name        = "${var.project_name}-${var.environment}-internet-gateway"
    Environment = var.environment
    Project     = var.project_name
  }
}


resource "aws_route_table" "route1" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  } 
  tags = {
    Type = "public"
    Name        = "${var.project_name}-${var.environment}-route-table"
    Environment = var.environment
    Project     = var.project_name
  }
}


resource "aws_route_table_association" "public_route1" {
  subnet_id = aws_subnet.public1.id
  route_table_id = aws_route_table.route1.id
}


resource "aws_route_table_association" "public_route2" {
  subnet_id = aws_subnet.public2.id
  route_table_id = aws_route_table.route1.id
}
