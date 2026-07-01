# Enterprise AWS FinOps Cost Optimization

## Overview

This project demonstrates an enterprise FinOps solution that combines Terraform, AWS native cost management services, Python automation, and Power BI to monitor, analyze, and visualize AWS cloud spending.

---

## Project Structure

```text
Enterprise-FinOps-Cost-Optimization/
├── terraform/
├── python/
├── powerbi/
├── reports/
├── screenshots/
├── README.md
└── .gitignore
```

---

## Technologies

- AWS
- Terraform
- Python
- Boto3
- AWS Cost Explorer
- AWS Budgets
- AWS Cost Optimization Hub
- CloudWatch
- Power BI

---

## Architecture

```text
Terraform
      │
      ▼
AWS Infrastructure
      │
      ▼
AWS Cost Explorer API
      │
      ▼
Python (Boto3)
      │
      ▼
CSV Report
      │
      ▼
Power BI Dashboard
```

---

# Implementation Steps

## Step 1: Provision AWS Infrastructure

Deploy AWS infrastructure using Terraform.

Resources deployed:

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Security Groups
- EC2 Instance
- EBS Volume
- Elastic IP

---

## Step 2: Configure AWS Cost Management

Configure AWS native FinOps services.

Tasks completed:

- Enable Cost Explorer
- Create AWS Budget
- Configure Budget Alerts
- Enable Cost Optimization Hub
- Review Compute Optimizer recommendations

---

## Step 3: Generate Cloud Cost Data

Develop a Python script using Boto3.

The script:

- Connects to AWS Cost Explorer
- Retrieves daily AWS cost data
- Groups costs by AWS service
- Exports results to CSV

---

## Step 4: Build the Power BI Dashboard

Import the generated CSV into Power BI.

Create:

- Total AWS Cost KPI
- Total Services KPI
- Date Filter
- Daily AWS Cost Trend
- AWS Cost by Service
- Daily Cost Details

---

## Step 5: Validate Cost Optimization

Review the environment for optimization opportunities.

Validate:

- Unused EBS Volumes
- Unattached Elastic IPs
- Service-level cloud costs
- Budget configuration
- Cost reporting

---

## Business Case

Cloud cost visibility enables organizations to identify waste, improve governance, optimize resource utilization, and support financial decision-making through FinOps practices.

---

## Project Outcome

- Automated AWS infrastructure deployment.
- Configured enterprise cloud cost governance.
- Automated AWS Cost Explorer reporting.
- Built an executive Power BI dashboard.
- Demonstrated cloud cost optimization workflows.
- Identified unused cloud resources.
- Delivered an enterprise FinOps reporting solution.

---

## Screenshots

## Screenshots

### Terraform Deployment

![Terraform State](screenshots/terraform-state-list.jpg)

### AWS Budget

![AWS Budget](screenshots/budget.jpg)

### Budget Details

![Budget Details](screenshots/budget-details.jpg)

### AWS Cost Explorer

![AWS Cost Explorer](screenshots/cost.jpg)

### AWS Cost Optimization Hub

![Cost Optimization Hub](screenshots/cost-hub.jpg)

### EC2 Instance

![EC2 Instance](screenshots/ec2.jpg)

### Elastic IP

![Elastic IP](screenshots/elastic-ip.jpg)

### Internet Gateway

![Internet Gateway](screenshots/internet-gateway.jpg)

### Route Table

![Route Table](screenshots/route-table.jpg)

### Security Groups

![Security Groups](screenshots/security-groups.jpg)

### Public Subnet

![Subnet](screenshots/subent.jpg)

### Additional Subnet

![Subnet 2](screenshots/subnet2.jpg)

### Unused EBS Volumes

![Unused EBS Volumes](screenshots/unused-volumes.jpg)

### Unused Elastic IP

![Unused Elastic IP](screenshots/unused-elastic-ip.jpg)

### Python Cost Report

![Python Script](screenshots/python.jpg)

### Power BI Dashboard

![Power BI Dashboard](screenshots/powerbi.jpg)

### Budget Alert (80%)

![80 Percent Budget Alert](screenshots/80-precent.jpg)

---

## Future Enhancements

- Amazon SNS Notifications
- AWS Lambda Automation
- EventBridge Scheduling
- Multi-Account Reporting
- Cost Anomaly Detection
- Executive Email Reporting

---

## Author

Promise Achinonu

Cloud Engineer | FinOps | AWS | Terraform | Python | Power BI
