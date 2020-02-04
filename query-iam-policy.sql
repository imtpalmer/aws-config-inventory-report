SELECT
    resourceId,
    resourceType,
    resourceName,
    resourceCreationTime,
    configuration.policyName,
    configuration.description,
    configuration.createdDate,
    awsRegion,
    tags
WHERE
    resourceType = 'AWS::IAM::Policy'