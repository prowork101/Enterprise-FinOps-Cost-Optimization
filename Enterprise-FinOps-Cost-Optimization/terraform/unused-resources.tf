resource "aws_ebs_volume" "unused_volume" {
  availability_zone = "${var.aws_region}a"
  size              = 8

  tags = {
    Name        = "unused-ebs-volume"
    Department  = "IT-Operations"
    Environment = var.environment
    FinOpsNote  = "Unattached volume for cost optimization analysis"
  }
}
resource "aws_eip" "unused_eip" {
  domain = "vpc"

  tags = {
    Name        = "unused-elastic-ip"
    Department  = "IT-Operations"
    Environment = var.environment
    FinOpsNote  = "Unused Elastic IP for FinOps reporting"
  }
}