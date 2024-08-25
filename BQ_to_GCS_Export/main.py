from google.cloud import bigquery
from google.cloud import storage

# Authenticate with Google Cloud using a service account key
client = bigquery.Client.from_service_account_json('<path/to/service_account_key>')
storage_client = storage.Client.from_service_account_json('<path/to/service_account_key>')

# Define the BigQuery SQL query to retrieve the data
query = """
    SELECT id,sum(sal) as salary_dept_wise
    FROM `project-location.tempdb.emp`
    group by department_id
"""

# Define the destination URI where the query results will be stored in GCS
bucket_name = 'my-bucket'
blob_name = 'emp.csv'
destination_uri = f'gs://{bucket_name}/{blob_name}'

# Run the query and export the results to GCS
query_job = client.query(query)
destination_blob = storage_client.bucket(bucket_name).blob(blob_name)
destination_blob.content_type = 'text/csv'
query_job.result().to_dataframe().to_csv(destination_blob.open('w'), index=False)

# Verify that the query results are exported to GCS
bucket = storage_client.get_bucket(bucket_name)
blob = bucket.get_blob(blob_name)
print(f'The query results are exported to {blob.public_url}')
