#!/bin/bash

# Create an S3 bucket for storing data backups
aws s3 mb s3://pharmacy-data-backups --region us-west-2

# Enable versioning for the S3 bucket
aws s3api put-bucket-versioning --bucket pharmacy-data-backups --versioning-configuration Status=Enabled

# Set up lifecycle policies (move old data to Glacier)
aws s3api put-bucket-lifecycle-configuration --bucket pharmacy-data-backups --lifecycle-configuration file://lifecycle-policy.json

# Upload data to S3 bucket (replace with actual data path)
aws s3 cp /path/to/backup-data s3://pharmacy-data-backups/ --recursive
