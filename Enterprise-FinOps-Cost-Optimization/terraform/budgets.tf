resource "aws_budgets_budget" "monthly_budget" {
  name         = "Enterprise-FinOps-Monthly-Budget"
  budget_type  = "COST"
  limit_amount = "25"
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  cost_types {
    include_credit = false
  }

  notification {
    comparison_operator = "GREATER_THAN"

    threshold      = 80
    threshold_type = "PERCENTAGE"

    notification_type = "ACTUAL"

    subscriber_email_addresses = [
      "proworkmail101@gmail.com"
    ]
  }
}