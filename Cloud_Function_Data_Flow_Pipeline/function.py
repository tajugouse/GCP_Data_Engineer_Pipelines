from googleapiclient.discovery import build

def trigger_df_job(cloud_event,environment):
    # Create a client instance
    service = build('dataflow', 'v1b3') 
    # Get the project ID from the event
    project = "data-engineer-poc-01" 
    
    template_path = "gs://dataflow-templates-us-central1/latest/GCS_Text_to_BigQuery"
    
    template_body = {
        "jobName": "bq-load",
        
    "parameters": {
        "inputFilePattern": "gs://bkt-storage-landing/user.csv",
        "JSONPath": "gs://bkt-storage-landing-metadata/bq.json",
        "outputTable": "data-engineer-poc-01:user_data.users",
        "bigQueryLoadingTemporaryDirectory": "gs://bkt-storage-landing-metadata",
        "javascriptTextTransformGcsPath": "gs://bkt-storage-landing-metadata/udf.js",
        "javascriptTextTransformFunctionName": "transform"
        }
    }
    
    request = service.projects().templates().launch(projectID=project,gcsPath=template_path,body=template_body)
    response = request.execute()
    print(response)
   
   
# import os
# from googleapiclient.discovery import build
# from googleapiclient.errors import HttpError

# def trigger_df_job(cloud_event, environment):
#     # Get project ID from environment variable
#     project = os.environ.get("PROJECT_ID")
#     if not project:
#         raise ValueError("PROJECT_ID environment variable not set.")

#     # Create a client instance
#     service = build('dataflow', 'v1b3') 

#     template_path = "gs://dataflow-templates-us-central1/latest/GCS_Text_to_Bigquery"

#     template_body = {
#         "jobName": "bq-load",
#         "parameters": {
#             "inputFilePattern": "gs://bkt-storage-landing/user.csv",
#             "JSONPath": "gs://bkt-storage-landing-metadata/bq.json",
#             "outputTable": f"{project}:user_data.users",  # Use project ID
#             "bigQueryLoadingTemporaryDirectory": "gs://bkt-storage-landing-metadata",
#             "javascriptTextTransformGcsPath": "gs://bkt-storage-landing-metadata/udf.js",
#             "javascriptTextTransformFunctionName": "transform"
#         }
#     }

#     try:
#         request = service.projects().locations().templates().launch(
#             projectId=project,  # Use projectId instead of projectID
#             location='us-central1',  # Specify the location
#             gcsPath=template_path,
#             body=template_body
#         )
#         response = request.execute()
#         print(response)
#     except HttpError as error:
#         print(f"Error launching Dataflow job: {error}")