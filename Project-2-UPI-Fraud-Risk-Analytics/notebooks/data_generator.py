import pandas as pd
import numpy as np
from faker import Faker
import random
from datetime import datetime, timedelta

# -----------------------------------
# INITIAL SETUP
# -----------------------------------

fake = Faker('en_IN')

np.random.seed(42)
random.seed(42)

NUM_TRANSACTIONS = 100000

# -----------------------------------
# MASTER DATA
# -----------------------------------

cities = [
    'Delhi',
    'Mumbai',
    'Bangalore',
    'Hyderabad',
    'Chennai',
    'Pune',
    'Kolkata',
    'Ahmedabad',
    'Jaipur',
    'Lucknow'
]

states = {
    'Delhi': 'Delhi',
    'Mumbai': 'Maharashtra',
    'Bangalore': 'Karnataka',
    'Hyderabad': 'Telangana',
    'Chennai': 'Tamil Nadu',
    'Pune': 'Maharashtra',
    'Kolkata': 'West Bengal',
    'Ahmedabad': 'Gujarat',
    'Jaipur': 'Rajasthan',
    'Lucknow': 'Uttar Pradesh'
}

banks = [
    'SBI',
    'HDFC',
    'ICICI',
    'Axis',
    'Kotak',
    'PNB',
    'Yes Bank'
]

merchant_categories = [
    'Grocery',
    'Food Delivery',
    'Fuel',
    'Travel',
    'Fashion',
    'Electronics',
    'Pharmacy',
    'Utilities'
]

payment_methods = [
    'UPI',
    'Wallet',
    'Debit Card',
    'Credit Card'
]

device_types = [
    'Android',
    'iPhone'
]

# -----------------------------------
# USERS & DEVICE MAPPING
# -----------------------------------

users = [f'U{i:05d}' for i in range(1, 5001)]

user_device_map = {}

for user in users:
    user_device_map[user] = f'DEV{random.randint(10000,99999)}'

# -----------------------------------
# TRANSACTION GENERATION
# -----------------------------------

transactions = []

start_date = datetime(2025, 1, 1)

for i in range(NUM_TRANSACTIONS):

    transaction_id = f'TXN{i:07d}'

    user_id = random.choice(users)

    merchant_id = f'M{random.randint(1000,9999)}'

    amount = round(np.random.exponential(scale=2000), 2)

    city = random.choice(cities)

    state = states[city]

    bank = random.choice(banks)

    merchant_category = random.choice(merchant_categories)

    payment_method = random.choice(payment_methods)

    transaction_time = start_date + timedelta(
        minutes=random.randint(0, 525600)
    )

    hour = transaction_time.hour

    device_type = random.choice(device_types)

    # -----------------------------------
    # DEVICE MISMATCH LOGIC
    # -----------------------------------

    if random.random() < 0.08:
        device_id = f'DEV{random.randint(10000,99999)}'
        new_device_flag = 1
    else:
        device_id = user_device_map[user_id]
        new_device_flag = 0

    # -----------------------------------
    # MIDNIGHT TRANSACTION FLAG
    # -----------------------------------

    midnight_flag = 1 if 0 <= hour <= 4 else 0

    # -----------------------------------
    # HIGH VALUE FLAG
    # -----------------------------------

    high_value_flag = 1 if amount > 25000 else 0

    # -----------------------------------
    # VELOCITY FLAG
    # -----------------------------------

    velocity_flag = 1 if random.random() < 0.03 else 0

    # -----------------------------------
    # LOCATION RISK FLAG
    # -----------------------------------

    high_risk_cities = ['Delhi', 'Mumbai']

    location_risk_flag = 1 if city in high_risk_cities else 0

    # -----------------------------------
    # FRAUD RISK SCORE
    # -----------------------------------

    risk_score = 0

    if midnight_flag:
        risk_score += 20

    if new_device_flag:
        risk_score += 30

    if high_value_flag:
        risk_score += 25

    if velocity_flag:
        risk_score += 35

    if location_risk_flag:
        risk_score += 15

    # -----------------------------------
    # RISK LEVEL
    # -----------------------------------

    if risk_score >= 61:
        risk_level = 'High'
    elif risk_score >= 31:
        risk_level = 'Medium'
    else:
        risk_level = 'Low'

    # -----------------------------------
    # FRAUD FLAG
    # -----------------------------------

    fraud_flag = 1 if risk_score >= 61 else 0

    # -----------------------------------
    # TRANSACTION STATUS
    # -----------------------------------

    if fraud_flag:
        transaction_status = 'Fraud'
    elif random.random() < 0.07:
        transaction_status = 'Failed'
    else:
        transaction_status = 'Success'

    # -----------------------------------
    # FAILURE REASONS
    # -----------------------------------

    failure_reasons = [
        'Bank Timeout',
        'Network Error',
        'Insufficient Balance',
        'UPI Server Down',
        'Authentication Failure'
    ]

    failure_reason = (
        random.choice(failure_reasons)
        if transaction_status == 'Failed'
        else None
    )

    # -----------------------------------
    # SAVE TRANSACTION
    # -----------------------------------

    transactions.append([
        transaction_id,
        user_id,
        merchant_id,
        amount,
        transaction_time,
        city,
        state,
        device_id,
        device_type,
        bank,
        merchant_category,
        payment_method,
        transaction_status,
        failure_reason,
        fraud_flag,
        hour,
        midnight_flag,
        high_value_flag,
        new_device_flag,
        velocity_flag,
        location_risk_flag,
        risk_score,
        risk_level
    ])

# -----------------------------------
# DATAFRAME CREATION
# -----------------------------------

columns = [
    'transaction_id',
    'user_id',
    'merchant_id',
    'amount',
    'transaction_time',
    'city',
    'state',
    'device_id',
    'device_type',
    'bank_name',
    'merchant_category',
    'payment_method',
    'transaction_status',
    'failure_reason',
    'fraud_flag',
    'hour_of_day',
    'midnight_flag',
    'high_value_flag',
    'new_device_flag',
    'velocity_flag',
    'location_risk_flag',
    'risk_score',
    'risk_level'
]

df = pd.DataFrame(transactions, columns=columns)

# -----------------------------------
# EXPORT CSV
# -----------------------------------

df.to_csv('data/upi_fraud_transactions.csv', index=False)

# -----------------------------------
# OUTPUT
# -----------------------------------

print(df.head())

print("\nDataset Shape:")
print(df.shape)

print("\nTransaction Status Distribution:")
print(df['transaction_status'].value_counts())

print("\nRisk Level Distribution:")
print(df['risk_level'].value_counts())