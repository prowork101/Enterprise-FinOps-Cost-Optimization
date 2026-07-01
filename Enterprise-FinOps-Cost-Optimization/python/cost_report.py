import boto3
import pandas as pd
from datetime import date, timedelta
from pathlib import Path

client = boto3.client("ce", region_name="us-east-1")

end_date = date.today()
start_date = end_date - timedelta(days=14)

response = client.get_cost_and_usage(
    TimePeriod={
        "Start": start_date.strftime("%Y-%m-%d"),
        "End": end_date.strftime("%Y-%m-%d"),
    },
    Granularity="DAILY",
    Metrics=["UnblendedCost"],
    GroupBy=[
        {
            "Type": "DIMENSION",
            "Key": "SERVICE",
        }
    ],
)

rows = []

for result in response["ResultsByTime"]:
    usage_date = result["TimePeriod"]["Start"]

    for group in result["Groups"]:
        service = group["Keys"][0]
        amount = float(group["Metrics"]["UnblendedCost"]["Amount"])

        rows.append({
            "Date": usage_date,
            "Service": service,
            "Cost": round(amount, 4),
        })

df = pd.DataFrame(rows)

output_dir = Path("output")
output_dir.mkdir(exist_ok=True)

output_file = output_dir / "aws_daily_service_costs.csv"
df.to_csv(output_file, index=False)

print("Cost report created successfully")
print(f"File saved to: {output_file}")
print(df.head())