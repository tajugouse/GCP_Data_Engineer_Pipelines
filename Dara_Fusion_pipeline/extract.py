import csv
from faker import Faker
import random
import string
from google.cloud import storage

# Specify number of employees to generate
num_employees = 10

# Create Faker instance
fake = Faker()

# Define the character set for the password
password_characters = string.ascii_letters + string.digits + 'm'

# Function to sanitize field values
def sanitize_field(value):
    return value.replace(',', ' ')  # Replace commas with a space

# Generate employee data and save it to a CSV file
with open('employee_data.csv', mode='w', newline='') as file:
    fieldnames = ['first_name', 'last_name', 'job_title', 'department', 'email', 'phone_number', 'salary', 'password']
    writer = csv.DictWriter(file, fieldnames=fieldnames)

    writer.writeheader()
    for _ in range(num_employees):
        writer.writerow({
            "first_name": sanitize_field(fake.first_name()),
            "last_name": sanitize_field(fake.last_name()),
            "job_title": sanitize_field(fake.job()),
            "department": sanitize_field(fake.job()),  # Generate department-like data using the job() method
            "email": sanitize_field(fake.email()),
            "phone_number": sanitize_field(fake.phone_number()),
            "salary": fake.random_number(digits=5),  # Generate a random 5-digit salary
            "password": ''.join(random.choice(password_characters) for _ in range(8))  # Generate an 8-character password with 'm'
        })

# Upload the CSV file to a GCS bucket
storage_client = storage.Client()
bucket_name = 'bkt-employee-data-poc1'
bucket = storage_client.bucket(bucket_name)
blob = bucket.blob('employee_data.csv')
blob.upload_from_filename('employee_data.csv')

print(f"CSV file uploaded to GCS bucket: {bucket_name}")
