resource "aws_cloudwatch_metric_alarm" "high_cpu_hr" {
  alarm_name          = "HR-High-CPU"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 70

  dimensions = {
    InstanceId = aws_instance.hr_app.id
  }

  alarm_description = "Alert when HR server CPU exceeds 70%"

  tags = {
    Department = "HR"
    Project    = var.project_name
  }
}

resource "aws_cloudwatch_metric_alarm" "high_cpu_accounts_payable" {
  alarm_name          = "Accounts-Payable-High-CPU"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 70

  dimensions = {
    InstanceId = aws_instance.accounts_payable_app.id
  }

  alarm_description = "Alert when Accounts Payable server CPU exceeds 70%"

  tags = {
    Department = "Accounts-Payable"
    Project    = var.project_name
  }
}