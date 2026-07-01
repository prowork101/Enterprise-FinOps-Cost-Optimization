data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "hr_app" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_hr.id
  vpc_security_group_ids = [aws_security_group.department_sg.id]

  tags = {
    Name        = "hr-payroll-app-server"
    Department  = "HR"
    Application = "Payroll"
    Environment = var.environment
    Owner       = "HR-Operations"
    CostCenter  = "HR-1001"
  }
}

resource "aws_instance" "accounts_payable_app" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_accounts_payable.id
  vpc_security_group_ids = [aws_security_group.department_sg.id]

  tags = {
    Name        = "accounts-payable-invoice-server"
    Department  = "Accounts-Payable"
    Application = "Invoice-Processing"
    Environment = var.environment
    Owner       = "Finance-Team"
    CostCenter  = "FIN-2001"
  }
}

resource "aws_instance" "it_ops_idle" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_it_ops.id
  vpc_security_group_ids = [aws_security_group.department_sg.id]

  tags = {
    Name        = "it-ops-idle-server"
    Department  = "IT-Operations"
    Application = "Infrastructure-Management"
    Environment = var.environment
    Owner       = "IT-Ops-Team"
    CostCenter  = "IT-3001"
    FinOpsNote  = "Idle server for rightsizing and waste analysis"
  }
}

resource "aws_instance" "security_stopped" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private_security.id
  vpc_security_group_ids = [aws_security_group.department_sg.id]

  tags = {
    Name        = "security-stopped-test-server"
    Department  = "Security"
    Application = "Security-Monitoring"
    Environment = var.environment
    Owner       = "Security-Team"
    CostCenter  = "SEC-4001"
    FinOpsNote  = "Stopped instance for unused resource analysis"
  }
}