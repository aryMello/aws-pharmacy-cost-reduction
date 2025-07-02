import json
import boto3

s3 = boto3.client('s3')

def lambda_handler(event, context):
    # Simulate inventory update
    inventory = {'Aspirin': 100, 'Ibuprofen': 150}
    
    # Upload the inventory data to S3
    response = s3.put_object(
        Bucket='pharmacy-data-backups',
        Key='inventory.json',
        Body=json.dumps(inventory)
    )
    
    return {
        'statusCode': 200,
        'body': json.dumps('Inventory updated successfully!')
    }
