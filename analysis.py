
import pandas as pd

df = pd.read_csv("data/cleaned_churn.csv", encoding = 'latin1')

print(df.head())


# Churn rate

churn_rate = df['Churn_Flag'].mean() * 100
print(churn_rate)

print(f"Churn rate: {churn_rate:.2f}%")



# Churn by contract

churn_contract = df.groupby('Contract')['Churn_Flag'].mean() * 100
print("Churn by contract:\n", churn_contract)


# Revenue loss

revenue_loss = df[df['Churn_Flag'] == 1]['YearlyRevenue'].sum()
print("Revenue Lost:", revenue_loss)


# Tenure vs churn

tenure_churn = df.groupby('Tenure_Group')['Churn_Flag'].mean() * 100
print("Churn by Tenure:\n", tenure_churn)


# Correlation

correlation = df[['MonthlyCharges','tenure','Churn_Flag']].corr()
print("Correlation:\n", correlation)

print(df.columns)

