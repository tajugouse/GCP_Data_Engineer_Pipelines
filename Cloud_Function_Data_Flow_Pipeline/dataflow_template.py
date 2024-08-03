

# POST /v1b3/projects/data-engineer-poc-01/locations/us-central1/templates:launch?gcsPath=gs://dataflow-templates-us-central1/latest/GCS_Text_to_BigQuery
{
    "jobName": "test-user-load",
    "environment": {
        "bypassTempDirValidation": false,
        "tempLocation": "gs://bkt-storage-landing-metadata/temp",
        "ipConfiguration": "WORKER_IP_UNSPECIFIED",
        "enableStreamingEngine": false,
        "additionalExperiments": [],
        "additionalUserLabels": {}
    },
    "parameters": {
        "inputFilePattern": "gs://bkt-storage-landing/user.csv",
        "JSONPath": "gs://bkt-storage-landing-metadata/bq.json",
        "outputTable": "data-engineer-poc-01:user_data.users",
        "bigQueryLoadingTemporaryDirectory": "gs://bkt-storage-landing-metadata",
        "javascriptTextTransformGcsPath": "gs://bkt-storage-landing-metadata/udf.js",
        "javascriptTextTransformFunctionName": "transform"
    }
    
}