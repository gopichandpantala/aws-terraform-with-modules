# --------------------------
# VPC
# --------------------------
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "${var.environment}-${var.project_name}-vpc"
    Environment = var.environment
  }
}

# --------------------------
# Internet Gateway
# --------------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.environment}-${var.project_name}-igw"
    Environment = var.environment
  }
}

# --------------------------
# Public Subnet
# --------------------------
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone_public

  tags = {
    Name        = "${var.environment}-${var.project_name}-public-subnet"
    Environment = var.environment
  }
}

# --------------------------
# Private Subnet
# --------------------------
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone_private

  tags = {
    Name        = "${var.environment}-${var.project_name}-private-subnet"
    Environment = var.environment
  }
}

# --------------------------
# Elastic IP for NAT Gateway
# --------------------------
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name        = "${var.environment}-${var.project_name}-nat-eip"
    Environment = var.environment
  }
}

# --------------------------
# NAT Gateway (in Public Subnet)
# --------------------------
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name        = "${var.environment}-${var.project_name}-nat-gateway"
    Environment = var.environment
  }

  depends_on = [aws_internet_gateway.igw]
}

# --------------------------
# Public Route Table
# --------------------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name        = "${var.environment}-${var.project_name}-public-rt"
    Environment = var.environment
  }
}

# Associate Public Subnet
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# --------------------------
# Private Route Table
# --------------------------
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name        = "${var.environment}-${var.project_name}-private-rt"
    Environment = var.environment
  }
}

# Associate Private Subnet
resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
