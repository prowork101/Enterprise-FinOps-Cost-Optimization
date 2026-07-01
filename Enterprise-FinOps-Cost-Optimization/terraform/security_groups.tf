resource "aws_security_group" "department_sg" {
  name        = "${var.project_name}-department-sg"
  description = "Security group for enterprise department servers"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow SSH from trusted IP for administration"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["100.16.125.31/32"]
  }

  ingress {
    description = "Allow HTTP for demo web access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-department-sg"
    Project     = var.project_name
    Environment = var.environment
    Owner       = "Cloud-FinOps-Team"
    CostCenter  = "ENT-1000"
  }
}