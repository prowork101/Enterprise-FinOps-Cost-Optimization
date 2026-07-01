resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "${var.project_name}-vpc"
    Environment = var.environment
    Project     = var.project_name
    Owner       = "Cloud-FinOps-Team"
    CostCenter  = "ENT-1000"
  }
}

resource "aws_subnet" "public_hr" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = {
    Name        = "public-hr-subnet"
    Department  = "HR"
    Application = "Payroll"
    Environment = var.environment
    CostCenter  = "HR-1001"
  }
}

resource "aws_subnet" "private_accounts_payable" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "${var.aws_region}a"

  tags = {
    Name        = "private-accounts-payable-subnet"
    Department  = "Accounts-Payable"
    Application = "Invoice-Processing"
    Environment = var.environment
    CostCenter  = "FIN-2001"
  }
}

resource "aws_subnet" "private_it_ops" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "${var.aws_region}b"

  tags = {
    Name        = "private-it-ops-subnet"
    Department  = "IT-Operations"
    Application = "Infrastructure-Management"
    Environment = var.environment
    CostCenter  = "IT-3001"
  }
}

resource "aws_subnet" "private_security" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "${var.aws_region}b"

  tags = {
    Name        = "private-security-subnet"
    Department  = "Security"
    Application = "Security-Monitoring"
    Environment = var.environment
    CostCenter  = "SEC-4001"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.project_name}-igw"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name        = "${var.project_name}-nat-eip"
    Environment = var.environment
    Project     = var.project_name
    FinOpsNote  = "Elastic IP used for NAT Gateway cost visibility"
  }
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_hr.id

  tags = {
    Name        = "${var.project_name}-nat-gateway"
    Environment = var.environment
    Project     = var.project_name
    FinOpsNote  = "Temporary NAT Gateway for enterprise cost analysis"
  }

  depends_on = [aws_internet_gateway.main]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name        = "${var.project_name}-public-rt"
    Environment = var.environment
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name        = "${var.project_name}-private-rt"
    Environment = var.environment
    FinOpsNote  = "Private subnets route outbound internet through NAT Gateway"
  }
}

resource "aws_route_table_association" "public_hr" {
  subnet_id      = aws_subnet.public_hr.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_accounts_payable" {
  subnet_id      = aws_subnet.private_accounts_payable.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_it_ops" {
  subnet_id      = aws_subnet.private_it_ops.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_security" {
  subnet_id      = aws_subnet.private_security.id
  route_table_id = aws_route_table.private.id
}