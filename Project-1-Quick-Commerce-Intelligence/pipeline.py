import pandas as pd
import numpy as np
from faker import Faker
import random
import os

def generate_quick_commerce_data(num_orders=100000):
    """Simulates real-world Indian quick-commerce transactional data."""
    fake = Faker('en_IN')
    cities = ["Delhi", "Mumbai", "Bangalore", "Hyderabad", "Pune", "Chennai", "Kolkata", "Ahmedabad"]
    categories = ["Dairy", "Snacks", "Beverages", "Fruits", "Personal Care", "Frozen Food", "Household"]
    
    # Simulating data generation logic structured in your 02_data_generation notebook
    data = []
    for _ in range(num_orders):
        order_amount = round(random.uniform(150, 1200), 2)
        sla_minutes = random.choice([10, 15, 25])
        data.append([fake.uuid4(), random.choice(cities), random.choice(categories), order_amount, sla_minutes])
        
    df = pd.DataFrame(data, columns=['order_id', 'city', 'category', 'order_amount', 'sla_minutes'])
    return df

def clean_and_transform(df):
    """Vectorized calculation engine optimizing performance metrics."""
    # Simulating your cleaning logic bypassing slow python loops
    df['cleaned_order_amount'] = df['order_amount'].fillna(df['order_amount'].median())
    return df

if __name__ == "__main__":
    print("Executing automated operational data pipeline...")
    
    # 1. Generate and process the data
    raw_df = generate_quick_commerce_data()
    processed_df = clean_and_transform(raw_df)
    
    # 2. FIX: Automatically create the exports folder if it doesn't exist
    output_dir = "exports"
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
        print(f"Created missing directory: '{output_dir}/'")
        
    # 3. Save the file safely
    output_path = os.path.join(output_dir, "refined_delivery_metrics.csv")
    processed_df.to_csv(output_path, index=False)
    
    print(f"Pipeline run successful! Output written to: {output_path}")