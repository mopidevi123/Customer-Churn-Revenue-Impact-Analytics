
import pandas as pd

df = pd.read_csv("data/customer_churn.csv", encoding='latin1')

print(df.head())

print(df.columns)

print(df.info())


# Convert total charges to numeric

df['TotalCharges'] = pd.to_numeric(df['TotalCharges'], errors='coerce')


# Fill missing values

df['TotalCharges'].fillna(df['TotalCharges'].median(), inplace=True)


# Clean column names

df.columns = df.columns.str.strip()


# Clean values

df['Churn'] = df['Churn'].str.strip()


# Convert yes/no to 1/0

df['Churn_Flag'] = df['Churn'].map({'Yes':1, 'No':0})



#Create revenue column

df['YearlyRevenue'] = df['MonthlyCharges'] * 12


# Tenure group

df['Tenure_Group'] = pd.cut(df['tenure'],
                            bins=[0,12,24,48,60,100],
                                labels = ['0-1yr','1-2yr','2-4yr','4-5yr','5+yr'])


# Save cleaned file

df.to_csv("data/cleaned_churn.csv", index = False)

print("Data cleaned successfully")

print(df.head())


# Calculate churn rate

churn_rate = df['Churn_Flag'].mean() * 100

print(churn_rate)
