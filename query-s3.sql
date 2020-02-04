SELECT
    resourceId,
    resourceType,
    resourceName,
    supplementaryConfiguration.BucketVersioningConfiguration.status
WHERE
    resourceType = 'AWS::S3::Bucket'